<legend>Contact Details</legend>
	<div class=".col-lg-12 col-md-12 col-sm-6">
		<div class ="table-responsive">
          		<table class="table table-bordered">
    	 		
    	 		<tr><td>Shipper:</td><td><i><input placeholder="Company Name" id="pickupShipper" name="pickupShipper" value="<?php echo $pickupShipper;?>" class="form-control" /></i></td></tr>
				<tr><td>Street Address:</td><td><input placeholder="Street Address" id="pickupAddress" name ="pickupAddress"  value="<?php echo $pickupAddress;?>" class="form-control" /></td></tr>
				<tr><td></td><td><?php if($service_por){echo $service_por;} ?> <?php echo $service_zip;?></td></tr>
    	 		<tr>
              		<td><?php echo $entry_pickupcontact; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickupcontact;?>" id="pickupcontact" name="pickupcontact" value="<?php echo $pickupcontact;?>" class="form-control" /></td>
              	</tr>
              	
              	<tr>
              		<td><?php echo $entry_pickuptelephone; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickuptelephone;?>" id="pickuptelephone"  name="pickuptelephone" value="<?php echo $pickuptelephone;?>" class="form-control" /></td>
              	</tr>
    	 		<tr>
              		<td><?php echo $entry_pickupfax; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickupfax;?>" id="pickupfax" name="pickupfax" value="<?php echo $pickupfax;?>" class="form-control" /></td>
              	</tr>
              	
              	<tr>
              		<td><?php echo $entry_pickupemail; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickupemail;?>" id="pickupemail" name="pickupemail" value="<?php echo $pickupemail;?>" class="form-control" /></td>
              	</tr>
              	
              	<tr>
              		<td><?php echo $entry_pickupreadydate; ?></td> 
              		<td><?php $rdate = new DateTime($readydate); echo date_format($rdate, 'm-d-Y'); ?></td>
              	</tr>
               
            	 <tr>
            	 <td>Instructions for Trucking:</td>
            	<td>
            	<textarea placeholder="Instructions for Trucking"  id="bkpuspecinst"  name="bkpuspecinst" class="form-control" ><?php echo $bkpuspecinst; ?></textarea>
            	</td>
            	</tr>
            	<tr>
              		<td>Receiving Hours:</td> 
              		<td><input type="text" placeholder="Receiving Hours "  id="pickupReceivingHrs" name="pickupReceivingHrs" value="<?php echo $pickupReceivingHrs;?>" class="form-control" /></td>
              	</tr>
            	
              	</table>
      
        		<table class="table table-bordered">
    	 		<tbody > 
    	 		<tr><td>
    	 			<table>
    	 			
    	 			<tr><td colspan ="2" class= "underline">Calculated Sell Values</td></tr>
    	 			<tr><td>Rate/CWT</td><td name="rates_precarriage" ><?php echo $rates_precarriage; ?></td></tr>
    	 			<tr><td>Minimum</td><td  name="rates_precarriage_min"><?php echo $rates_precarriage_min; ?></td></tr>
    	 			
    	 			
    	 			</table>	
    	 		
    	 		</td><td>
    	 			<table>
    	 			<tr><td colspan ="2" class= "underline">Calculated Cost Values</td></tr>
    	 			<tr><td>Rate/CWT</td><td><?php echo $truckingrate;?></td></tr>
    	 			<tr><td>Minimum</td><td><?php echo $truckingrate_min;?></td></tr>
    	 			
    	 			
    	 			</table>
    	 		
    	 		</td></tr>
    	 		</tbody>
    	 		</table>
     		</div><!--"booking-content" -->
     		
     	</div><!--"tab-content" -->
		
		

<script type="text/javascript">

	$("input[name=pickupShipper]").change(function(){
		var pickupShipper =$("#pickupShipper").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupShipper', 'value':pickupShipper});
		});

	$("input[name=pickupAddress]").change(function(){
		var pickupAddress =$("#pickupAddress").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupAddress', 'value':pickupAddress});
		});
	
	$("input[name=pickupcontact]").change(function(){
		var pickupcontact =$("#pickupcontact").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupcontact', 'value':pickupcontact});
		});

	$("input[name=pickuptelephone]").change(function(){
		var pickuptelephone =$("#pickuptelephone").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickuptelephone', 'value':pickuptelephone});
		});

	$("input[name=pickupfax]").change(function(){
		var pickupfax =$("#pickupfax").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupfax', 'value':pickupfax});
		});

	$("input[name=pickupemail]").change(function(){
		var pickupemail =$("#pickupemail").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupemail', 'value':pickupemail});
		});

	$("input[name=pickupReceivingHrs]").change(function(){
		var pickupReceivingHrs =$("#pickupReceivingHrs").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupReceivingHrs', 'value':pickupReceivingHrs});
		});
	
	$("textarea[name=bkpuspecinst]").change(function(){
		var bkpuspecinst =$("#bkpuspecinst").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'bkpuspecinst', 'value':bkpuspecinst});
		
		$('textarea[name=\'bkpuspecinst\']').val(bkpuspecinst);
		});
	
</script>




	