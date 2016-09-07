<div class=".col-lg-12 col-md-12 col-sm-6">
		<div class='row'>	
			<div class ="trucking-trucker">
			<legend><?php echo $text_trucking_trucker; ?></legend>
				<div class ="table-responsive">
				              	
              	<table class="table table-bordered">
              	
              	<tr>
              	<td>
              	<a><?php echo $entry_truckingtrucker; ?></a><span class="help">	click for <a TARGET="_blank" href="<?php echo $tt_shipper_contact ;?>" >Tech-Tip</a></span>
				
				</td></tr>
		
              	<tr>
              		
              		<td><textarea name="truckingpickup" id="truckingpickup" class="truck form-control" ><?php echo $truckingpickup;?></textarea></td>
              	</tr>
              	
              	</table>
				<table class="table table-bordered">
			
				 <tr><td>Shipment ID</td><td><input type="text" placeholder="Shipment ID" id="truckingshipid" name="truckingshipid" value="<?php echo $truckingshipid;?>"	 class="truck form-control" /></td></tr> 			 
				 				 
				
				<tr><td>Density:</td><td><input type="text" placeholder="PCF (Density)" id="truckingpcf"  name="truckingpcf" value="<?php echo $truckingpcf;?>" class="truck form-control" /></td></tr>
				
				<tr><td>Time / Distance:</td><td><input type="text" placeholder="Days" id="truckingdays" name="truckingdays" value="<?php echo $truckingdays;?>" class="truck form-control" />  <input type="text" placeholder="Miles"  value="<?php echo $cts_miles;?>" class="truck form-control" /></td></tr>
              		
    	 		<tr>
              		<td>Cost Rate/CWT:</td> 
              		<td><input type="text" placeholder="Rate" id="truckingrate" name="truckingrate" value="<?php echo $truckingrate;?>" class="truck form-control" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckingminimum; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckingminimum;?>" name="truckingrate_min" value="<?php echo $truckingrate_min;?>" class="truck form-control" /></td>
              	</tr>
              	<tr>
              		<td>Fuel Surcharge %</td> 
              		<td><input type="text" placeholder="Fuel Surcharge %" name="entry_truckingfuel" value="" class="truck form-control" /></td>
              	</tr>
              	
              	<tr>
              		<td><?php echo $entry_truckercontact; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckercontact;?>" id="truckercontact" name="truckercontact" value="<?php echo $truckercontact;?>" class="truck form-control" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckertelephone; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckertelephone;?>"  id="truckertelephone" name="truckertelephone" value="<?php echo $truckertelephone;?>" class="truck form-control" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckerfax; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckerfax;?>"  id="truckerfax" name="truckerfax" value="<?php echo $truckerfax;?>" class="truck form-control" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckingemail; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckingemail;?>" id="truckingemail" name="truckingemail" value="<?php echo $truckingemail;?>" class="truck form-control" /></td>
              	</tr>
              	</table>
              	
				</div><!--"booking-content" -->
		</div><!-- end "trucking-trucker" -->
	</div>	                 
</div>
<script type="text/javascript">

	$("#truckingpickup").change(function(){
	var truckingpickup =$("#truckingpickup").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingpickup', 'value':truckingpickup});
	});
	
	$("input[name=truckingdays]").change(function(){
	var truckingdays =$("#truckingdays").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingdays', 'value':truckingdays});
	});
	
	$("input[name=truckercontact]").change(function(){
	var truckercontact =$("#truckercontact").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckercontact', 'value':truckercontact});
	});

	$("input[name=truckertelephone]").change(function(){
		var truckertelephone =$("#truckertelephone").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckertelephone', 'value':truckertelephone});
		});

	$("input[name=truckerfax]").change(function(){
		var truckerfax =$("#truckerfax").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckerfax', 'value':truckerfax});
		});

	$("input[name=truckingemail]").change(function(){
		var truckingemail =$("#truckingemail").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingemail', 'value':truckingemail});
		});

</script>


<script type="text/javascript">$("input[name=truckingrate_min]").change(function(){
	var truckingrate_a = $("input[name=truckingrate]").val();
	var truckingrate_min_a = $("input[name=truckingrate_min]").val();
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_min', 'value':truckingrate_min_a});	
	$('input[name=\'truckingrate_min\']').val(truckingrate_min_a);

	
	var commodity_lbs = $("input[name='commodity_lbs']").val();	
	var commodity_lbs2 = Number(commodity_lbs.replace(/[^0-9\.]+/g,""));
	var commodity_wm = parseFloat(commodity_lbs2 * 0.01);
		
	var truckingrate_min_profit  = $("input[name=truckingrate_min_profit]").val();
	var truckingrate_markup		 = $("input[name=truckingrate_markup]").val();
	var truckingrate_max_profit  = $("input[name=truckingrate_max_profit]").val();
	var truckingrate_per_effect  = $("input[name=truckingrate_per_effect]").val();

	var truckingrate = parseFloat(truckingrate_a);
	var truckingrate_min = parseFloat(truckingrate_min_a);
	var min_profit  = parseFloat(truckingrate_min_profit);
	var markup  = parseFloat(truckingrate_markup);
	var max_profit  = parseFloat(truckingrate_max_profit);
	var per_effect  = parseFloat(truckingrate_per_effect);
	var trucking_profit = (truckingrate_min * (1 + markup))- truckingrate_min;
	var profit =  parseFloat(trucking_profit);

	if (!truckingrate || truckingrate < .01){
		truckingrate = truckingrate_min / commodity_wm;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate', 'value':truckingrate});	
		$('input[name=\'truckingrate\']').val(truckingrate);
	}
	
	
	if (profit < min_profit){
		
		var rates_precarriage_min = truckingrate_min + min_profit;
		var rates_precarriage = (truckingrate_min * (1+markup))/commodity_wm;		
	}
	
	if (profit > max_profit){
		var rates_precarriage_min = truckingrate_min + max_profit;
		var rates_precarriage = rates_precarriage_min / commodity_wm;
		}
	
	if (profit < max_profit) {
		if (profit > min_profit){
		var rates_precarriage_min =(truckingrate_min * (1+markup));
		var rates_precarriage = (truckingrate_min * (1+markup))/commodity_wm;
		}
	}
	
	var rates_precarriage_sum = commodity_wm * parseFloat(rates_precarriage)||0;
	var rates_precarriage_sum = rates_precarriage_sum.toFixed(2);

	$('input[name=\'rates_precarriage\']').val(rates_precarriage);
	$('input[name=\'rates_precarriage_min\']').val(rates_precarriage_min);
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_min);
	$('input[name=\'truckingrate_sell\']').val(rates_precarriage);
	$('input[name=\'truckingrate_sell_min\']').val(rates_precarriage_min.toFixed(2));
		
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage', 'value':rates_precarriage.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_sell', 'value':rates_precarriage.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_sell_min', 'value':rates_precarriage_min.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage_min', 'value':rates_precarriage_min.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage_amount', 'value':rates_precarriage_min.toFixed(2)});
	
	
	});
</script>

<script type="text/javascript">$(document).ready(function() {
	$(".truck").each(function() {
		if ((this.value != null) && this.value.length != 0) {
			$(this).css("background-color", "#FEFFB0"); 
		}
	});

	
	$(".truck").change("keyup", function() {
		$(".truck").each(function() {
			if ((this.value != null) && this.value.length != 0) {
				$(this).css("background-color", "#FEFFB0"); 
			}
		});
	}); 
	

});
</script>


