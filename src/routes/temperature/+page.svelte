<script>
    import { onMount } from "svelte";
    import { moyPerYear } from "./temperatureData.js"
    let ville = '';
    let pays = '';
    let nbAnnee = 2;
    let deb_date = '';

    let today = new Date();
    let year = today.getFullYear();
    let month = (today.getMonth() + 1).toString().padStart(2, '0'); // Months are zero-based
    let day = today.getDate().toString().padStart(2, '0');

    let fin_date = `${year}-${month}-${day}`;
    

    let locLat = -1;
    let locLng = -1;

    onMount(() => {

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
            getTempLoc();
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
            moyPerYear(data.daily.temperature_2m_max, data.daily.time)
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
</main>