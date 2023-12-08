<script>
    import { onMount, onDestroy } from "svelte";
    import {Map, MapStyle, Marker, Popup, config} from '@maptiler/sdk';
    import "@maptiler/sdk/dist/maptiler-sdk.css";

    let map;
    let marker;
    let mapContainer;

    config.apiKey = "WieJt3VOP2JmuqGm3Kyl";

    onMount(() => {
        const initialState = { lng: 139.753, lat: 35.6844, zoom: 14 };

        map = new Map({
            container: mapContainer,
            style: MapStyle.STREETS,
            center: [initialState.lng, initialState.lat],
            zoom: initialState.zoom,
        });

        marker = new Marker({color: "#FF0000"});
        marker.setLngLat([0,0]);

        map.on('click', (event) => {
            marker.addTo(map);
            let {lng, lat} = event.lngLat;
            marker.setLngLat([lng, lat]);
        });

    });

    onDestroy(() => {
        //map.remove();
    });
</script>

<div class="map-wrap">
    <div class="map" bind:this={mapContainer}></div>
</div>

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
