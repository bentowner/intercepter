<div class="panel panel-default">
  <div class="panel-heading">
 
    
    <h3 class="panel-title"><i class="fa fa-eye"></i> <?php echo $heading_title; ?></h3>
    <span class="pull-right" ><a onclick="displaymap()">( view / hide )</a> </span>
  </div>
 
  <div class="panel-body" id ="map1" style="display:none" >
    <div id="vmap" style="width: 100%; height: 260px;"></div>
  </div>
</div>
<link type="text/css" href="view/javascript/jquery/jqvmap/jqvmap.css" rel="stylesheet" media="screen" />
<script type="text/javascript">function displaymap() {$("#map1").toggle(); 
		
		map();
		
		function map(){
			$.ajax({
				url: 'index.php?route=dashboard/map/map&token=<?php echo $token; ?>',
				dataType: 'json',
				success: function(json) {
					data = [];
								
					for (i in json) {
						data[i] = json[i]['total'];
					}
							
					$('#vmap').vectorMap({
						map: 'world_en',
						backgroundColor: '#FFFFFF',
						borderColor: '#FFFFFF',
						color: '#9FD5F1',
						hoverOpacity: 0.7,
						selectedColor: '#666666',
						enableZoom: true,
						showTooltip: true,
						values: data,
						normalizeFunction: 'polynomial',
						onLabelShow: function(event, label, code) {
							if (json[code]) {
								label.html('<strong>' + label.text() + '</strong><br />' + '<?php echo $text_booking; ?> ' + json[code]['total'] + '<br />' + '<?php echo $text_service; ?> ' + json[code]['amount']);
							}
						}
					});			
				},
		        
			});		
		}
	}
</script>
<script type="text/javascript" src="view/javascript/jquery/jqvmap/jquery.vmap.js"></script> 
<script type="text/javascript" src="view/javascript/jquery/jqvmap/maps/jquery.vmap.world.js"></script> 
