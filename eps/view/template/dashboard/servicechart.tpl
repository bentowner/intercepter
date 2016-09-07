<div class="panel panel-default">
  <div class="panel-heading">
    <div class="pull-right"><span ><a onclick="displaychart2()">( view / hide )</a> </span> 
    <?php if($service){?>
        <select id="service_selected" onchange="getServiceChart(this.value)">
			<option value="NONE">{select a CFS}</option>
			<?php foreach($service as $key => $value){?>
				<?php echo '<option value="'.$value['OrigCode'].'">'.$value['OrigName'].'</option>';  ?>
				<?php  }?>	
		</select>
        
           <?php }?>
      
      
    </div>
    <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i> <?php echo $heading_title; ?></h3>
  </div><div class="range" > </div> 
  <div class="panel-body" id="LoadingBoard" style="display:none">
    <div id="serviceReport" style="width: 100%; height: 260px;"></div>
  </div>
</div>
		
        
<script type="text/javascript">function displaychart2() {$("#LoadingBoard").toggle(); }</script>
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.js"></script> 
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.resize.min.js"></script>

<script type="text/javascript"><!--
function getServiceChart(service_selected) {
		
	$.ajax({
		type: 'get',
		url: 'index.php?route=dashboard/servicechart/chartService&token=<?php echo $token; ?>&service_selected='+ service_selected,
		dataType: 'json',
		async: false,
		success: function(json) {
			var option = {	
				shadowSize: 0,
				lines: { 
					show: true,
					fill: true,
					lineWidth: 1
				},
				grid: {
					backgroundColor: '#FFFFFF'
				},	
				xaxis: {
            		ticks: json['xaxis']
				}
			}

			$.plot($('#serviceReport'), [json['open'], json['received'],json['overdue']], option);
		}
	});
}
getServiceChart($('#service_selected').val());
//--></script>  