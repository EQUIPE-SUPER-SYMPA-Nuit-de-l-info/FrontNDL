export const moyPerYear = (temperatures, days) => {
    const yearData = {};

    for (let i = 1; i < days.length; i++) {
            const year = new Date(days[i]).getFullYear();
        
            if (!yearData[year]) {
                yearData[year] = { sum: 0, count: 0 };
            }
            
            yearData[year].sum += temperatures[i];
            yearData[year].count++;
    }

    const averages = {};
    for (const year in yearData) {
        averages[year] = (yearData[year].sum / yearData[year].count).toPrecision(4);
    }

    const firstYear = Object.keys(averages)[0];
    delete averages[firstYear];

    return averages;
}

