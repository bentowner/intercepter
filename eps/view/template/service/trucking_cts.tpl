<legend><?php echo $entry_ctscarrier; ?></legend>
			<div class=".col-lg-12 col-md-12 col-sm-6">
				<div class ="table-responsive">
				
				<table  class="table ">
				<tr id ="carrier_info">
					
				<?php if ($carrier_info && $carrier_info!=null) { 
					echo "<td>";
					
					echo "<table class='table table-bordered' bgcolor='#FFFFFF' >";	
					echo "<tr bgcolor='#F5F5DC' border ='0'><td>SCAC</td><td>Name</td><td>TT</td><td>Amount</td></tr>";				
					for ($row = 0; $row < $CTS_carriers; $row++)
									
					{	
					echo "<tr>";
					if ($ActiveSession=='Quote'){
					echo "<td> ".$carrier_info[$row]["scac"]."</td><td><a href='index.php?route=service/quotations/updateTrucking&token=";
					} else {					
					echo "<td> ".$carrier_info[$row]["scac"]."</td><td><a href='index.php?route=service/booking/updateTrucking&token=";
					}
					echo "".$token."&truckingnumber=".($row)."'> ".$carrier_info[$row]["name"]."</a></td><td>".$carrier_info[$row]["days"]."</td><td>$".$carrier_info[$row]["finalcharge"]."</td>";
					echo "<tr/>";
					}
						
					echo "</table>";
					echo "</td>";				
				}else{ ?>	
				<td>
					Use List Truckers button to retieve a list of Carriers!<p> <span class="help">click for <a TARGET="_blank" href="<?php echo $tt_cts ;?>" >Tech-Tip</a></span> about CTS.
				</td>	
				<?php } ?>
				
				</tr>
				</table>
				
			<div class=".col-lg-12 col-md-12 col-sm-12 well">	
				<div class=".col-lg-5 col-md-5 col-sm-5">
				<table class="table ">
              			<?php if ($pickuppresidentialpu == "true") { ?>
              			<tr><td><input type="checkbox" id = "pickuppresidentialpu" name = "pickuppresidentialpu" checked="checked" value="<?php echo $pickuppresidentialpu; ?>"></td><td> Resident Pick Up</td></tr>
			  			<?php } else { ?>
			  			<tr><td><input type="checkbox" id = "pickuppresidentialpu" name = "pickuppresidentialpu" value="<?php echo $pickuppresidentialpu; ?>"></td><td> Resident Pick Up</td></tr>
			  			<?php } ?>
			  			
			  			<?php if ($pickupliftgate == "true") { ?>
			  			<tr><td><input type="checkbox" id = "pickupliftgate" name = "pickupliftgate" checked="checked" value="<?php echo $pickupliftgate; ?>"></td><td> <?php echo $entry_pickupliftgate; ?></td></tr>
			  			<?php } else { ?>
			  			<tr><td><input type="checkbox" id = "pickupliftgate" name = "pickupliftgate" value="<?php echo $pickupliftgate; ?>"></td><td> <?php echo $entry_pickupliftgate; ?></td></tr>
			  			<?php } ?>
			  			
			  			<?php if ($pickupexcesslen == "true") { ?>
			  			<tr><td><input type="checkbox" id = "pickupexcesslen" name = "pickupexcesslen" checked="checked" value="<?php echo $pickupexcesslen; ?>"></td><td> Excess Len</td></tr>
			  			<?php } else { ?>
			  			<tr><td><input type="checkbox" id = "pickupexcesslen" name = "pickupexcesslen" value="<?php echo $pickupexcesslen; ?>"></td><td> Excess Len</td></tr>
			  			<?php } ?>
			  			
			  			<?php if ($pickupappt == "true") { ?>
			  			<tr><td><input type="checkbox" id = "pickupappt" name = "pickupappt" checked="checked"  value="<?php echo $pickupappt; ?>"></td><td> <?php echo $entry_pickupappt; ?></td></tr>
            			<?php } else { ?>
            			<tr><td><input type="checkbox" id = "pickupappt" name = "pickupappt" value="<?php echo $pickupappt; ?>"></td><td> <?php echo $entry_pickupappt; ?></td></tr>
            			<?php } ?>
            			
				</table>
				</div>
				<div class=".col-lg-7 col-md-7 col-sm-7">
				<table class="table">
					<tbody id="carrier_hidden" name ="carrier_hidden"  class = "carrier_hidden" > 
						<tr><td>Min Profit </td><td><input type="text" placeholder="Min Profit" id="truckingrate_min_profit" name="truckingrate_min_profit" value="<?php echo $truckingrate_min_profit; ?>" class="form-control" /></td></tr>
						<tr><td>Markup %</td><td><input type="text" placeholder="Markup%" name="truckingrate_markup" value="<?php echo $truckingrate_markup; ?>" class="form-control" /> </td></tr>
						<tr><td>Max Profit</td><td><input type="text" placeholder="Max Profit" name="truckingrate_max_profit" value="<?php echo $truckingrate_max_profit; ?>" class="form-control" /> </td></tr>
						<tr><td>Pers Eff Profit</td><td><input type="text" placeholder="Pers Eff Profit" name="truckingrate_per_effect" value="<?php echo $truckingrate_per_effect; ?>" class="form-control" /> </td>	</tr>
						
					</tbody>
				</table>
				</div>
			</div><!--"end well" -->
		</div><!--"booking-content" -->
			
			
				</div><!-- end "tab" -->
			
		

<script type="text/javascript">


	$("input[name=pickuppresidentialpu]").change(function(){
		var pickuppresidentialpu =$("#pickuppresidentialpu").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickuppresidentialpu', 'value':pickuppresidentialpu})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'carrier_info', 'value':null})	;
		document.getElementById("carrier_info").style.display = "none"
		$('input[name=\'pickuppresidentialpu\']').val(pickuppresidentialpu);
	});

	$("input[name=pickupliftgate]").change(function(){
		var pickupliftgate =$("#pickupliftgate").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupliftgate', 'value':pickupliftgate})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'carrier_info', 'value':null})	;
		document.getElementById("carrier_info").style.display = "none"
		$('input[name=\'pickupliftgate\']').val(pickupliftgate);
	});

	$("input[name=pickupexcesslen]").change(function(){
		var pickupexcesslen =$("#pickupexcesslen").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupexcesslen', 'value':pickupexcesslen})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'carrier_info', 'value':null})	;
		document.getElementById("carrier_info").style.display = "none"
		$('input[name=\'pickupexcesslen\']').val(pickupexcesslen);
	});

	$("input[name=pickupappt]").change(function(){
		var pickupappt =$("#pickupappt").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupappt', 'value':pickupappt})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'carrier_info', 'value':null})	;
		document.getElementById("carrier_info").style.display = "none"
		$('input[name=\'pickupappt\']').val(pickupappt);
	});

	
	$("input[name=commodity]").change(function(){
	var commodity =$("#commodity").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity', 'value':commodity});
	});	
	
	$("input[name=customerref]").change(function(){
	var customerref =$("#customerref").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerref', 'value':customerref});
	});
	
	$("input[name=instruction]").change(function(){
	var instruction = $("#instruction").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'instruction','value':instruction});
	$('input[name=\'instruction\']').val(instruction);
	});
	
</script>	
	<script type="text/javascript">$("input[name=truckingrate_per_effect]").live('change',function(){
	
	var truckingrate_per_effect =$("input[name=truckingrate_per_effect]").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_per_effect', 'value':truckingrate_per_effect});

	var truckingrate = $("input[name=truckingrate]").val();
	var truckingrate_min_a = $("input[name=truckingrate_min]").val();
	var commodity_lbs = $("input[name='commodity_lbs']").val();	
	var commodity_lbs2 = Number(commodity_lbs.replace(/[^0-9\.]+/g,""));
	var commodity_wm = parseFloat(commodity_lbs2 * 0.01);
		
	var truckingrate_min_profit  = $("input[name=truckingrate_min_profit]").val();
	var truckingrate_markup		 = $("input[name=truckingrate_markup]").val();
	var truckingrate_max_profit  = $("input[name=truckingrate_max_profit]").val();
	var truckingrate_per_effect  = $("input[name=truckingrate_per_effect]").val();

	var truckingrate_min = parseFloat(truckingrate_min_a);
	var min_profit  = parseFloat(truckingrate_min_profit);
	var markup  = parseFloat(truckingrate_markup);
	var max_profit  = parseFloat(truckingrate_max_profit);
	var per_effect  = parseFloat(truckingrate_per_effect);
	
	var trucking_profit = (truckingrate_min * (1 + markup))- truckingrate_min;
	
	var profit =  parseFloat(trucking_profit);
	
	if (profit < min_profit){
		
		var rates_precarriage_min = truckingrate_min + min_profit;
		var rates_precarriage = (truckingrate_min * (1+truckingrate_markup))/commodity_wm;		
	}
	
	if (profit > max_profit){
		var rates_precarriage_min = truckingrate_min + max_profit;
		var rates_precarriage = rates_precarriage_min / commodity_wm;
		}
	
	if (profit < truckingrate_max_profit) {
		if (profit > min_profit){
		var rates_precarriage_min =(truckingrate_min * (1+truckingrate_markup));
		var rates_precarriage = (truckingrate_min * (1+truckingrate_markup))/commodity_wm;
		}
	}
	
	var rates_precarriage_sum = commodity_wm * parseFloat(rates_precarriage)||0;
	var rates_precarriage_sum = rates_precarriage_sum.toFixed(2);

	$('input[name=\'rates_precarriage\']').val(rates_precarriage);
	$('input[name=\'truckingrate_sell\']').val(rates_precarriage);
	$('input[name=\'rates_precarriage_min\']').val(rates_precarriage_min);
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_min);
	$('input[name=\'truckingrate_sell_min\']').val(rates_precarriage_min.toFixed(2));
		
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage', 'value':rates_precarriage.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_sell', 'value':rates_precarriage.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_sell_min', 'value':rates_precarriage_min.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage_min', 'value':rates_precarriage_min.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage_amount', 'value':rates_precarriage_min.toFixed(2)});
		
	});</script>
          
                 