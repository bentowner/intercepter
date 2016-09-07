<div class="panel panel-default">
  			<div class="panel-heading">
  			<h3 class="panel-title"><i class="fa fa-child"></i> <?php echo $heading_title; ?></h3>
  			</div>
  			 <div class="panel-body" >

  			 <div class="col-lg-12 col-md-12 col-sm-6">
  			 <div class="row">
  			 <legend>Skills Matrix</legend>
  			  <div class="row">
  				<div class="col-lg-7 col-md-7 col-sm-6">
  					<div id="booking_employee" style="width: 100%; height: 200px; float: left;opacity: 0.85; filter: alpha(opacity=85);"></div>
  				</div>
  				<div class="col-lg-5 col-md-5 col-sm-6">
  					<div id="legend"></div>
  				</div>
  			  </div>
  			</div>

       	  </div>
        </div>
      </div>



<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
      google.load("visualization", "1.0", {packages:["corechart"]});
      google.setOnLoadCallback(drawBookingChart);
      function drawBookingChart() {

    	 var data = new google.visualization.DataTable();
          data.addColumn('string', 'Employee');
          data.addColumn('number', 'count');
          data.addColumn('string', 'Link');
          data.addRows([

			<?php foreach ($pie_booking as $booking_person) { ?>
				<?php echo $booking_person; ?>,
			<?php } ?>

          ]);

        var booking_options = {legend:{position:'left',},
                				pieSliceText: 'Employee',
                			    is3D: true,
                			    sliceVisibilityThreshold: .01,
                			    chartArea:{left:-50,top:0,width:'100%',height:'100%', backgroundColor: 'transparent', }

                			      };
        var chart = new google.visualization.PieChart(document.getElementById('booking_employee'));

        google.visualization.events.addListener(chart, 'select', function() {

            var selectedItem = chart.getSelection()[0];
            if (selectedItem) {
              var link = data.getValue(selectedItem.row, 2);
              var decoded = link.replace(/&amp;/g, '&');

              location=decodeURI(decoded);
            }
         });

        chart.draw(data, booking_options);

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
</script>
