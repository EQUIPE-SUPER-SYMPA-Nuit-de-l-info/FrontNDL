<!-- <script>
    import Chart from 'chart.js/auto';
    import { getRelativePosition } from 'chart.js/helpers';

    export let listOfData;
    console.log(listOfData)

    const labels = [];
    for (let i = 0; i < listOfData.length; i++) {
        labels.add(listOfData[i]) = listOfData[i];
        
    }

    const data = {
    labels: labels,
    datasets: [{
        label: `Température sur ${listOfData.lenght} ans`,
        data: listOfData,
        fill: false,
        borderColor: 'rgb(75, 192, 192)',
    }]
    };

    const chart = new Chart(ctx, {
        type: 'line',
        data: data,
        options: {
            onClick: (e) => {
            const canvasPosition = getRelativePosition(e, chart);

            // Substitute the appropriate scale IDs
            const dataX = chart.scales.x.getValueForPixel(canvasPosition.x);
            const dataY = chart.scales.y.getValueForPixel(canvasPosition.y);
            }
        }
    });
</script> -->