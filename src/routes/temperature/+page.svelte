<script>
    import { moyPerYear } from "./temperatureData.js";
    import { onMount, onDestroy } from "svelte";
    import {Map, MapStyle, Marker, Popup, config} from '@maptiler/sdk';
    import Chart from "chart.js/auto"
    let ville = '';
    let pays = '';
    let nbAnnee = 2;
    let deb_date = '';

    let today = new Date();
    let year = today.getFullYear();
    let month = (today.getMonth() + 1).toString().padStart(2, '0'); // Months are zero-based
    let day = today.getDate().toString().padStart(2, '0');

    let fin_date = `${year}-${month}-${day}`;
    
    let avgPerYear = {};

    let locLat = -1;
    let locLng = -1;

    let chart;

    let map;
    let marker;
    let mapContainer;

    config.apiKey = "WieJt3VOP2JmuqGm3Kyl";
    

    function initializeChart() {
      const ctx = document.getElementById("temperatureChart").getContext("2d");
  
      const data = {
        labels: Object.keys(avgPerYear),
        datasets: [
          {
            label: "Température",
            data: Object.values(avgPerYear),
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            borderColor: "rgba(75, 192, 192, 1)",
            borderWidth: 1,
          },
        ],
      };
  
      const options = {
        scales: {
          y: {
            beginAtZero: true,
          },
        },
      };
  
      chart = new Chart(ctx, {
        type: "line",
        data: data,
        options: options,
      });
    }
  
    function updateChart() {
      if (chart) {
        chart.data.labels = Object.keys(avgPerYear);
        chart.data.datasets[0].data = Object.values(avgPerYear);
        chart.update();
      }
    }

    onMount(() => {
        initializeChart();

        const initialState = { lng: 2.294, lat: 48.54, zoom: 14 };

        map = new Map({
            container: mapContainer,
            style: MapStyle.STREETS,
            center: [initialState.lng, initialState.lat],
            zoom: 3,
        });

        marker = new Marker({color: "#FF0000"});
        marker.setLngLat([0,0]);

        map.on('click', (event) => {
            marker.addTo(map);

            //récupère ici les coordonnées et stock les dans loglng loglat

            let {lng, lat} = event.lngLat;
            locLat = lat.toPrecision(4);
            locLng = lng.toPrecision(4);
            console.log(locLat, locLng);
            getTempLoc();
            marker.setLngLat([lng, lat]);
        });
    })


    const getLocation = async () => {

        let tmp = new Date(today);
        tmp.setFullYear(today.getFullYear() - nbAnnee);
        let annee = tmp.getFullYear();
        let mois = (tmp.getMonth() + 1).toString().padStart(2, '0'); // Les mois commencent à 0
        let jour = tmp.getDate().toString().padStart(2, '0');
        deb_date = `${annee}-${mois}-${jour}`;

        await fetch(`https://geocode.maps.co/search?q=${ville}+${pays}&type=town`)
        .then(response => {
            if (!response.ok) {
            throw new Error(`Erreur HTTP! Code: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            locLat = ((parseFloat(data[0].boundingbox[0]) + parseFloat(data[0].boundingbox[1]))/2).toPrecision(6);
            locLng = ((parseFloat(data[0].boundingbox[2]) + parseFloat(data[0].boundingbox[3]))/2).toPrecision(6);
            avgPerYear = getTempLoc();
            console.log(avgPerYear);
        })
        .catch(error => {
            console.error('Erreur lors de la requête fetch:', error);
        });
    }

    const getTempLoc = async () => {
        await fetch(`https://archive-api.open-meteo.com/v1/archive?latitude=${locLat}&longitude=${locLng}&start_date=${deb_date}&end_date=${fin_date}&daily=temperature_2m_max&timezone=auto`)
        .then(response => {
            if (!response.ok) {
            throw new Error(`Erreur HTTP! Code: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            console.log(data.daily.temperature_2m_max);
            console.log(data.daily.time);
            avgPerYear = moyPerYear(data.daily.temperature_2m_max, data.daily.time)
            updateChart(avgPerYear);
        })
        .catch(error => {
            console.error('Erreur lors de la requête fetch:', error);
        });
    }
</script>

<main>
    <label for="ville">Ville</label>
    <input bind:value={ville} id="ville" placeholder="Ville" />
    <label for="pays">Pays</label>
    <input bind:value={pays} id="pays" placeholder="Pays" />
    <label for="nbannee">Nombre d'années</label>
    <input bind:value={nbAnnee} type="number" min="2" max="82">
    <input type="button" on:click={getLocation} value="GET">
    <!-- {#if avgPerYear != {}}
        <GraphDrawer listOfData={avgPerYear}/>
    {/if} -->

    <canvas id="temperatureChart"></canvas>
    <div class="map-wrap">
        <div class="map" bind:this={mapContainer}></div>
    </div>
</main>

<style>
    .map-wrap {
        position: relative;
        width: 100%;
        height: calc(
            100vh - 77px
        ); /* calculate height of the screen minus the heading */
    }

    .map {
        position: absolute;
        width: 100%;
        height: 100%;
    }
</style>
