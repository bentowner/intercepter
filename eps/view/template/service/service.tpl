	<?php if ($ActiveSession == "Booking") { ?>
		<?php if ($pickup == "true") { ?>	
	    	  <div class="form-group required">
			   <div class="col-sm-6 col-sm-offset-3" >
			  <input type="text" class="form-control"  placeholder="Point of <?php echo $entry_service_por; ?>" id ="service_por" name="service_por" value="<?php echo $service_por;?>" size="35" /> 
			  </div>
				<div class="col-sm-3" >
			<?php if ($service_por) { ?>
				<input type="text" placeholder="Zip Code" id="service_zip" name="service_zip" value="<?php echo $service_zip;?>" size="10" class="form-control" /> 
			<?php } else { ?>
				<input type="text" placeholder="Zip Code" id="service_zip"  name="service_zip" value="<?php echo $service_zip;?>" size="10" class="form-control" /> 
			<?php } ?>
				</div>
			</div>
		<?php } ?>
	<?php } else { ?>
			 <div class="form-group required">
			   <div class="col-sm-6 col-sm-offset-3" >
			  <input type="text" class="form-control"  placeholder="Point of <?php echo $entry_service_por; ?>" id ="service_por" name="service_por" value="<?php echo $service_por;?>" size="35" /> 
			  </div>
				<div class="col-sm-3" >
			<?php if ($service_por) { ?>
				<input type="text" placeholder="Zip Code" id="service_zip" name="service_zip" value="<?php echo $service_zip;?>" size="10" class="form-control" /> 
			<?php } else { ?>
				<input type="text" placeholder="Zip Code" id="service_zip"  name="service_zip" value="<?php echo $service_zip;?>" size="10" class="form-control" /> 
			<?php } ?>
				</div>
			</div>
	<?php } ?>
		
		<div class="form-group required">
			 <span id="error_origin" class="required" style="display:none"><br>*Please Complete.</span>
		<label class="col-sm-3 control-label" for="service_portofloading"><a onmouseover="displayWarehouse()"><?php echo $entry_service_portofloading; ?></a></label>
		<?php if ($quotenumber) { ?>	
			  <div class="col-sm-7">
	            <input type="search" placeholder="Origin CFS" name="service_portofloading" id="service_portofloading"  value="<?php echo $service_portofloading;?>"   class="form-control" />
		      </div>
	    <?php }else { ?>	
			 <div class="col-sm-7">
            	<input type="search" placeholder="Origin CFS" name="service_portofloading" id="service_portofloading"   value="<?php echo $service_portofloading;?>"  class="form-control" />
	      	 </div> 
	     <?php } ?>
			<div class="col-sm-2">
			<?php if ($viaOrigin) { ?>via <?php echo $viaOrigin; ?> <?php if ($Bkapl && $viaOrigin!==$Bkapl) { ?> (*actual <?php echo $Bkapl; ?>) <?php } ?><?php } ?>
			</div>
			
			
			
		<div id="warehouse_hidden" style="display:none">
		 <tbody><tr><td>
		<?php if ($warehouse_info) { ?><p>CFS code number <?php echo $service_warehouse;?><br>
		 <span class ="detail"><?php echo $warehouse_name;?>	
    	 <br><?php echo $warehouse_address;?>
    	 <br><?php echo $warehouse_city;?>
    	 <br><?php echo $warehouse_phone;?></span>
	    	 <?php if ($warehouse_cutoff) { ?>
	    	 	<br><br>Cut-off Date / Time <br><span class ="detail"> <?php echo $warehouse_cutoffday;?> <?php echo $warehouse_cutofftime;?></span>
	    	 <?php } ?>
    	 <?php } else { ?>
    		No CFS selected
    	 <?php } ?>
    	 
    	 </td></tr>
    	 </tbody>
    	</div>
    	
    	 <input type="hidden" name="service_portofloading_code" value="<?php echo $service_portofloading_code; ?>" />	
         
    	</div>
    	
		
    	 <div class="form-group required">
		  
			 <span id="error_origin" class="required" style="display:none"><br>*Please Complete.</span>
			<label class="col-sm-3 control-label" for="service_portofdest"><a onmouseover="displayAgent()"><?php echo $entry_service_portofdest; ?></a></label>
	        
    <?php if ($quotenumber) {?>	 	
    		 <div class="col-sm-7">
            	<input disabled="disabled" type="search" placeholder="Destination CFS" name="service_portofdest" id="service_portofdest"  value="<?php echo $service_portofdest;?>" onchange="serviceUpdate();" class="form-control" />
	      	 </div>
	<?php } else { ?>
			 <div class="col-sm-7">
            	<input type="search" placeholder="Destination CFS" name="service_portofdest" id="service_portofdest"  value="<?php echo $service_portofdest;?>"   class="form-control" />
	      	 </div>
   	<?php } ?>	
   			
   			<div class="col-sm-2">
			<?php if ($viaDest) { ?>via <?php echo $viaDest; ?>  <?php } ?>
			</div>
			
		<input type="hidden" name="service_portofdest_code" value="<?php echo $service_portofdest_code; ?>"   class="form-control" />
		</div>
		
		<div  id="service_hidden" style="display:none" >
		 <tbody>
		 <tr><td><span id="errorservice_portofloading" class="required" style="display:none">*Please Complete.</span></td>
				  <?php if ($agent_code) { ?><td >Service is <span class ="detail"><?php echo $service_name;?></span> with rotation <?php echo $service_rotation;?>.<br>  The agent is:
				  <span class ="detail"><br> <?php echo $agent_name;?> 
				  <br> <?php echo $agent_address1;?> 
				  <br> <?php echo $agent_address2;?> 
				  <br> <?php echo $agent_city;?> 
				  <br>(tel) <?php echo $agent_phone;?> 
				  <br> <?php echo $agent_email;?> </span>
				  </td>		
				 <?php } else { ?>
				 <td>No Service selected. </td>
				 <?php } ?>
			 </tbody>	
		</div>
		
		
    	  <div id="pointofdelivery" class="form-group" style="display:none" >
    	  	<div class="col-sm-3"></div>
	    	<div class="col-sm-7 col-sm-offset-3">
	    	  <input type="text" placeholder="Point of <?php echo $entry_service_pod;?>" id="service_pod" name="service_pod" value="<?php echo $service_pod;?>"  class="form-control" /> 
	    	  </div>
	    	<div class="col-sm-2"></div>
    	  </div>
		
		
	<?php if ($ActiveSession == "Booking") { ?>
		<?php if ($pickup == "true") { ?>
		<div class="col-sm-12"> 
			<div class="form-group required col-sm-5">
				<label class="control-label" for="readydate">Ready Date:</label>
				  <div id="readydate" class="input-group date">
		        	<input type="text" name="readydate"  value="<?php echo $readydate; ?>" onchange="DoSubmit();" data-date-format="YYYY-MM-DD" class="form-control" />
	                  <span class="input-group-btn">
	                  <button type="button" class="btn btn-info"><i class="fa fa-calendar"></i></button>
	                  </span> 
		          </div>
	      	</div>
	      	<div class="col-sm-5"><br><br><span class="help">click for <a TARGET="_blank" href="<?php echo $tt_ready_date ;?>" >Tech-Tip</a></span></div>
	      	
      	</div>
      	<?php } ?>
    
    <?php } ?>
    
      	<div class="col-sm-12"> 
      	<?php if ($ActiveSession=='Quote' ) { ?>
      	<?php if ($service_portofloading_code) { ?>
      	<span class="col-sm-offset-4" >Carrier: <b><?php echo $carrier_name; ?></b></span>
      	
     	<?php } ?>
      	
      	<br>
      	<div  class="form-group required col-sm-5"> 
      	  <label class="control-label" for="day_to_expire">Days valid</label>
      		<input type="text" name="day_to_expire" style="text-align: center"  value="<?php echo $day_to_expire; ?>" onchange="" class="form-control" />
	      </div>
	     
	      <div  class="form-group col-sm-7">
	      <label class="control-label" for="date_expire">Date of Expiration</label>
	      <input type="date" disabled="disabled" name="date_expire" data-date-format="YYYY-MM-DD"  value="<?php echo $date_expire; ?>" style="text-align: center" onchange="" class="form-control" />
	      </div>   
		</div>
		
		<?php } else { ?>
		
	      	<div class="form-group required col-sm-5">
	            <label class=" control-label" for="idd">Intended Delivery:</label>
	                <div id="idd" class="input-group date">
	    <?php if ($pickup == "true") { ?>
	                  <input type="text" disabled ="true" name="idd" value="<?php echo $idd; ?>" data-date-format="YYYY-MM-DD"  onchange="DoSubmit();" class="form-control" />
	    
	    <?php }else {  ?>	
	                  <input type="text" name="idd" value="<?php echo $idd; ?>"  data-date-format="YYYY-MM-DD" onchange="DoSubmit();" class="form-control" />
	                  
	                  <span class="input-group-btn">
	                  <button type="button" class="btn btn-primary"><i class="fa fa-calendar"></i></button>
	                  </span>
	    <?php } ?>             
	                  
	                 </div>
	         </div> 
	         


	     
	         <div  class="form-group required col-sm-7"> 
	         		<label class=" control-label" for="service_vessel">Search for Vessel:</label>
	         		<div class="input-group">
	                <input type="search" id ="service_vessel" name="service_vessel" value="<?php echo $service_vessel; ?>" class="form-control"/>
	        <?php if ($service_portofloading_code && !empty($service_portofloading_code) ) { ?>
						 <span class="input-group-btn">
						 <a data-toggle="tooltip" title="<?php echo $button_vessel; ?>" class="btn btn-info sail"><i class="fa fa-anchor"></i></a> 
						 
			    <?php if ($pickup=='true') { ?>
		      				 <a type="button" id="button-trucking" form="form-booking" href="<?php echo $add_trucking; ?>" data-toggle="tooltip" title="<?php echo $button_trucking; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a>
		        <?php } ?>
						 </span>
			<?php } else {?>
					 	<span class="input-group-btn">
						 <a data-toggle="tooltip" title="<?php echo $button_vessel_help; ?>" onclick="serviceUpdate();" class="btn btn-info "><i class="fa fa-tags"></i></a> 
				<?php if ($pickup=='true') { ?>
		      				 <a type="button" id="button-trucking" form="form-booking" href="<?php echo $add_trucking; ?>" data-toggle="tooltip" title="<?php echo $button_trucking; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a>
		        <?php } ?>
						 </span>
			<?php } ?>
					</div>
	                <br>
	   			<span id="error_idd" class="required" style="display:none"><br>*Please Complete Date or Vessel.</span>
	   		 </div>
		    </div>	
	    
	    <div class="form-group">
		    <div class="col-sm-6"> 
		    	<div class="row"><?php if ($service_ldt){?> <?php echo $entry_service_ldt; ?><?php echo $service_ldt ;?> <?php echo $service_ldt_day ;?> <?php echo $service_ldt_time ;?><?php } ?></div>
		    	<div class="row"><?php if ($doc_cuts){?> <?php echo $entry_doc_cuts; ?> <?php echo $doc_cuts; ?> <?php } ?></div>
			    <div class="row"><?php if ($service_etd){;?><?php echo $entry_service_etd; ?> <?php echo $service_etd; ?><?php } ?></div>
		   		<div class="row"><?php if ($service_eta){;?><?php echo $entry_service_eta; ?> <?php echo $service_eta; ?><?php } ?></div>
		    </div>	
		    	
	    	 <div class="col-sm-6"> 
		    	<div class="row"><?php if ($service_aescomplete == "true") { ?><b>AES Complete</b><?php } else if ($service_aescomplete == "false") { ?>
              		<span class="required" ><b>AES Not Complete</b></span><?php } ?>
               	</div>
			    <div class="row"><?php if ($service_itn){;?> ITN: <?php echo $service_itn; ?> <?php } ?> </div>
		   		<div class="row"><?php if ($service_decaes == "true" || $service_decaes == "Y") { ?>TCL Filing AES:$<?php echo $rates_aesfilingbytcl; ?><?php } ?></div>
		   		<div class="row"><?php if ($labeldate){;?>Label Date <?php echo date("m-d-Y", strtotime($labeldate));?><?php } ?></div>
		    </div>
		</div>	
		<div class="form-group">
			<div class="row"><?php echo $service_lpman; ?></div>
			<div class="row"><?php echo $service_hblnumber; ?></div>
       		<div class="row"><?php echo $service_container; ?></div>
          	<div class="row"><?php echo $service_confirmedeta; ?></div>
        </div>  
       <?php }  ?>				



	
	
<script type="text/javascript">$('input[name=\'service_vessel\']').autocomplete({
	delay: 100,source: function(request, response) {$.ajax({
		url: 'index.php?route=service/booking/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),dataType: 'json',
				success: function(json) {
					
	response($.map(json, function(item) {return {
		label: 'Cargo Cut:'+item.cargocut + '| Aes Cut:' + item.aescut +' | Sail:' + item.saildate + ' | ' + item.name + ' V' + item.voyage + ' | ' +item.SCAC + ' | ETA:' + item.eta,
		label2: item.name+'/'+item.voyage,label3:item.cargocut,label4:item.aescut,label5:item.saildate,label6:item.eta,label7:item.name,label8:'V'+item.voyage,label9:item.bkssl,label10:item.vesseq,value: item.vessel_id}}));
	}});},
	select: function(event, ui) {$('input[name=\'service_vessel\']').val(ui.item.label2);
	$('input[name=\'vessel_id\']').val(ui.item.value);
	$('input[name=\'idd\']').val(ui.item.label3);
	$('input[name=\'service_ldt\']').val(ui.item.label3);
	$('input[name=\'service_etd\']').val(ui.item.label5);
	$('input[name=\'service_eta\']').val(ui.item.label6);
	$('input[name=\'service_voyage\']').val(ui.item.label8);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_vessel', 'value':(ui.item.label7)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'vessel_id', 'value':(ui.item.value)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'idd', 'value':(ui.item.label3)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_ldt', 'value':(ui.item.label3)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_onboarddate', 'value':(ui.item.label4)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_etd', 'value':(ui.item.label5)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_eta', 'value':(ui.item.label6)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_voyage', 'value':(ui.item.label8)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'bkssl', 'value':(ui.item.label9)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'vesseq', 'value':(ui.item.label10)});	
		return false;	},	
	
	focus: function(event, ui) {     	
		return false;   	}
		});
</script>


<script type="text/javascript"><!---// Service Port of Loading //-->

$(document).ready(function() {

	var url_portload = 'index.php?route=service/service/getPortofLoading&token=<?php echo $token; ?>&filter_name=';
	var url_portdest = 'index.php?route=service/service/getPortofDest&token=<?php echo $token; ?>&filter_name=';
	var url= '<?php echo $update_service; ?>&token=<?php echo $token; ?>';
	var portofload_filled = $("#service_portofloading").val();
	var portofdest_filled = $("#service_portofdest").val();
	
	if(portofload_filled.length >1){
		if(portofdest_filled.length < 1){
			$('input[name=\'service_portofdest\']').focus();
			}
		}	

	
	$('input[name=\'service_portofloading\']').autocomplete({
		
		'source': function(request, response) {
			$.ajax({url: url_portload +  encodeURIComponent(request),
					dataType: 'json',
					
					success: function(json) {
						response($.map(json, function(item) {
							return {label: item['service_portofloading'],value: item['service_portofloading_code']}
							}));
						},
					
			});
			
		},
		
	 
		'select': function(item) {
							$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofloading', 'value':item['label']});
							$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofloading_code', 'value':item['value']});
							$('input[name=\'service_portofloading\']').val(item['label']);
							$('input[name=\'service_portofloading_code\']').val(item['value']);
							$.post('index.php?route=service/booking/updateWarehouse&token=<?php echo $token; ?>');
							//this.value=item.value; 
		}
						
	}).bind('keyup', function(e) {
		var code = (e.keyCode ? e.keyCode : e.which);
		var query = $("#service_portofloading").val();
		service_portofloading='';
		service_portofloading_code='';
        $.get(url_portload + query, function(data){
	    	list = JSON.parse(data);
	    });

        if ($("#service_portofloading").val().length > 2){
			if (list.length == 1){
				$('input[name=\'service_portofloading\']').val(list[0].service_portofloading); 
				$('input[name=\'service_portofloading_code\']').val(list[0].service_portofloading);
				
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofloading_code', 'value':list[0].service_portofloading_code});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofloading', 'value':(list[0].service_portofloading) });

				ServicePOL_warehouse(list[0].service_portofloading_code);
				
			}
		};
				    
		if(code == $.ui.keyCode.ENTER) {
			$(this).autocomplete("close");
		}

		
	});
		
		$('input[name=\'service_portofdest\']').autocomplete({
			'delay': 100,
			'autoFocus': true,
			'source': function(request, response) {
				
				
				$.ajax({
					url: url_portdest +  encodeURIComponent(request),
					dataType: 'json',
					success: function(json) {
							response($.map(json, function(item) {
								return {
									
								value: 	item['service_portofdest_code'],
								label:  item['service_portofdest'],
								label2: item['service_portofdest_charge'],
								label3: item['service_portofdest_agent_charge'],
								label4: item['service_portofdest_agent_personal'],
								label5: item['service_portofdest_agent_forward']
							}}));
							
						}});
				},
			'select': function(item) {						
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_code', 'value':item['value']});	
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest', 'value':item['label']});		
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_charge', 'value':item['label2']});	
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_agent_charge', 'value':item['label3']});
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_agent_personal', 'value':item['label4']});
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_agent_forward', 'value':item['label5']});
						
						$('input[name=\'service_portofdest\']').val(item['label']);
						$('input[name=\'service_portofdest_code\']').val(item['value']);
						ServicePOD_service();
						//serviceUpdate();
					}
				}).bind('keyup', function(e) {
					var code = (e.keyCode ? e.keyCode : e.which);
					var query = $("#service_portofdest").val();
					service_portofdest='';
					service_portofdest_code='';
					
					 $.get(url_portdest + query, function(data){
					    	list_dest = JSON.parse(data);
					    });

					 if ($("#service_portofdest").val().length > 2){
							if (list_dest.length == 1){
								
								$('input[name=\'service_portofdest\']').val(list_dest[0].service_portofdest);
								$('input[name=\'service_portofdest_code\']').val(list_dest[0].service_portofdest_code);
								
								$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest', 'value':(list_dest[0].service_portofdest) });
								$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_code', 'value':list_dest[0].service_portofdest_code});
								
								ServicePOD_service(list[0].service_portofdest_code);
							}
						};
							    
					if(code == $.ui.keyCode.ENTER) {
						$(this).autocomplete("close");
					}

					
				});

		
		 
		

		 
		 
		
	});	
	

function ServicePOL_warehouse(){ $('input[name=\'service_portofloading\']').autocomplete( "close" ); $("#service_portofdest").focus();};
function ServicePOD_service(){ $("#service_portofdest").autocomplete( "close" );
$("#commodity").focus();
};
function serviceUpdate(){ window.location = url;		 }
function displayAgent() {$("#service_hidden").toggle(); };
function displayWarehouse() {$("#warehouse_hidden").toggle(); };

$(document).ready(function () {
    $(":input[data-autocomplete]").each(function () {
        $(this).autocomplete({ 
            source: $(this).attr("data-autocomplete"),
            select: function(event, ui) { 
                $(this).blur(); 
            }
        });
    });
});

</script>



	
<script type="text/javascript">$("input[name=service_por]").change(function(){var service_por = $("#service_por").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_por', 'value':service_por});$('input[name=\'service_por\']').val(service_por);});</script>	
<script type="text/javascript">$("input[name=service_pod]").change(function(){var service_pod = $("#service_pod").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_pod', 'value':service_pod});});</script>	
<script type="text/javascript">$("input[name=service_zip]").change(function(){var service_zip = $("#service_zip").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_zip', 'value':service_zip});});</script>	
	
