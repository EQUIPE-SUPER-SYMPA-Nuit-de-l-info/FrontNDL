<script>
    let ville = '';
    let pays = '';

    let locLat = -1;
    let locLng = -1;

    const getLocation = async () => {
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
            getTempLoc(locLat, locLng);
        })
        .catch(error => {
            console.error('Erreur lors de la requête fetch:', error);
        });
    }

    const getTempLoc = async (lat, lng) => {

    }
</script>

<main>
    <label for="ville">Ville</label>
    <input bind:value={ville} id="ville" placeholder="Ville" />
    <label for="pays">Pays</label>
    <input bind:value={pays} id="pays" placeholder="Pays" />
    <input type="button" on:click={getLocation} value="GET">
</main>