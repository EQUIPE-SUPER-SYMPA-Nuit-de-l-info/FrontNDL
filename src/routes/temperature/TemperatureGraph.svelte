<script>
    import { onMount, afterUpdate } from "svelte";
  
    export let listOfData;
  
    let chart;
  
    function initializeChart() {
      const ctx = document.getElementById("temperatureChart").getContext("2d");
  
      const data = {
        labels: Object.keys(listOfData),
        datasets: [
          {
            label: "Température",
            data: Object.values(listOfData),
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
        chart.data.labels = Object.keys(listOfData);
        chart.data.datasets[0].data = Object.values(listOfData);
        chart.update();
      }
    }
  
    export function updateChartWithData(newData) {
      listOfData = newData;
      updateChart();
    }
  
    onMount(() => {
      initializeChart();
    });
  
    afterUpdate(() => {
      updateChart();
    });
  </script>
  
  <style>
    canvas {
      max-width: 600px;
      max-height: 400px;
    }
  </style>
  
  <canvas id="temperatureChart"></canvas>