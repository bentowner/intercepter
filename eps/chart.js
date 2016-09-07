
      google.load("visualization", "1.0", {packages:["corechart"]}); 
      google.setOnLoadCallback(drawBookingChart);
      function drawPortfolioChart() {
     
    	var data = new google.visualization.DataTable();
          data.addColumn('string', 'Security');
          data.addColumn('number', 'Cost');
          data.addColumn('string', 'UpdateLink');
          data.addRows([	{loop - values}   ]);

        var portfolio_options = {legend:{position:'left',},
                				pieSliceText: 'Portfolio',
                			    is3D: true,
                			    sliceVisibilityThreshold: .01,
                			    chartArea:{left:-50,top:0,width:'85%',height:'80%', backgroundColor: 'transparent', }
                			      };

        var chart = new google.visualization.PieChart(document.getElementById('portfolio'));
       
        google.visualization.events.addListener(chart, 'select', function() {
                       
            var selectedItem = chart.getSelection()[0];
            if (selectedItem) {
              var link = data.getValue(selectedItem.row, 2);
              var decoded = link.replace(/&amp;/g, '&');
              location=decodeURI(decoded);            
            }
         });
        
        chart.draw(data, portfolio_options);
        
        var total = 0;
        for (var i = 0; i < data.getNumberOfRows(); i++) {
            total += data.getValue(i, 1);
        }
        
        var legend = document.getElementById("legend");
        var legItem = [];
        for (var i = 0; i < data.getNumberOfRows(); i++) {
            var label = data.getValue(i, 0);
            var value = data.getValue(i, 1);
            var link = data.getValue(i,2);
            var percent = Number(100 * value / total).toFixed(1);

            // This will create legend list for the display
            legItem[i] = document.createElement('li');
            legItem[i].id = 'legend_' + data.getValue(i, 0);
            legItem[i].innerHTML = '<div class="list-item"><a href="' +link+'"> <span>' + label + '</a>: <b>' + value + '</b> (' + percent + '%)</span></div>';

            legend.appendChild(legItem[i]);
        }
        
      }
