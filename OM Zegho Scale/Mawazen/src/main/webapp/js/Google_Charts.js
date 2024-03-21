var chartPie = function (importValue,exportValue) {

    // Load the Visualization API and the corechart package.
    google.charts.load('current', {'packages': ['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
            ['صادر', exportValue],
            ['وارد', importValue]
        ]);

        // Set chart options
        var options = {
                title: 'معدل السيارات',
                pieHole: 0.4,
                width: 500,
                height: 400,
                titleTextStyle: {
                    fontSize: 18, // 12, 18 whatever you want (don't specify px)
                    fontName: 'DroidArabicKufiRegular'
                },
                legend: {
                    textStyle: {
                        fontName: 'DroidArabicKufiRegular'
                    }
                }
            }
        ;

        // Instantiate and draw our chart, passing in some options.
        /*var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);


        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
            ['صادر', 3],
            ['وارد', 1]
        ]);

        // Set chart options
        var options = {
            title: 'معدل السيارات',
            pieHole: 0.4,
            width: 500,
            height: 400,
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
        chart.draw(data, options);*/

    }
}