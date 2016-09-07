<?php echo $header; ?><?php echo $column_right; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
         <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
      
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>	
      </ul>
      
      <div>
      <?php if ($error_norates) { ?> <div class="warning" id="error_norates"><?php echo $error_norates; ?></div> <?php } ?>
 <?php if ($error_warning) { ?> <div class="warning" id="error_warning"><?php echo $error_warning; ?></div> <?php } ?>
 <?php if ($error_nocustomer) { ?> <div class="warning"  id="error_nocustomer"><?php echo $error_nocustomer; ?></div> <?php } ?>
 <?php if ($error_notype) { ?>  <div class="warning" id="error_notype" ><?php echo $error_notype; ?></div>  <?php } ?>
 <?php if ($error_nocommodity) { ?>  <div class="warning" id="error_nocommodity" ><?php echo $error_nocommodity; ?></div>  <?php } ?>
 <?php if ($error_nocommodity_weight) { ?>  <div class="warning" id="error_nocommodity_weight" ><?php echo $error_nocommodity_weight; ?></div>  <?php } ?>
 <?php if ($error_noorigin) { ?>  <div class="warning" id="error_noorigin"><?php echo $error_noorigin; ?></div>  <?php } ?>
 <?php if ($error_novessel) { ?>  <div class="warning" id="error_novessel"><?php echo $error_novessel; ?></div>  <?php } ?>
 <?php if ($error_prepaidcollect) { ?>  <div class="warning" id="error_prepaidcollect"><?php echo $error_prepaidcollect; ?></div>  <?php } ?>
 <?php if ($error_nodestination) { ?>  <div class="warning" id="error_nodestination"><?php echo $error_nodestination; ?></div>  <?php } ?>
 <?php if ($error_noacceptorigin) { ?>  <div class="warning" id="error_noacceptorigin"><?php echo $error_noacceptorigin; ?></div>  <?php } ?>
 <?php if ($error_noacceptdest) { ?>  <div class="warning" id="error_noacceptdest"><?php echo $error_noacceptdest; ?></div>  <?php } ?>
 <?php if ($error_noidd) { ?>  <div class="warning" id="error_noidd"><?php echo $error_noidd; ?></div>  <?php } ?>
 <?php if ($error_readydatereqd) { ?>  <div class="warning" id="error_readydatereqd"><?php echo $error_readydatereqd; ?></div>  <?php } ?>
 <?php if ($error_quotereqd) { ?>  <div class="warning" id="error_quotereqd"><?php echo $error_quotereqd; ?></div>  <?php } ?>
 <?php if ($error_trucktransitreqd) { ?>  <div class="warning" id="error_trucktransitreqd"><?php echo $error_trucktransitreqd; ?></div>  <?php } ?>
 <?php if ($error_doormove) { ?>  <div class="warning" id="error_doormove"><?php echo $error_doormove; ?></div>  <?php } ?>
 <?php if ($error_hazardous) { ?>  <div class="warning" id="error_hazardous"><?php echo $error_hazardous; ?></div>  <?php } ?>
 
 
 <?php if ($error_message) { ?> <div class="attention" id="error_message"><?php echo $error_message; ?></div> <?php } ?>
 <?php if ($error_clone) { ?>  <div class="attention"><?php echo $error_clone; ?></div>  <?php } ?>
 <?php if ($error_restrictions_blcl) { ?>  <div class="attention"><?php echo $error_restrictions_blcl; ?></div>  <?php } ?>
 <?php if ($error_restrictions_corq) { ?>  <div class="attention"><?php echo $error_restrictions_corq; ?></div>  <?php } ?>
 <?php if ($error_restrictions_invoice) { ?>  <div class="attention"><?php echo $error_restrictions_invoice; ?></div>  <?php } ?>
 <?php if ($error_restrictions_insp) { ?>  <div class="attention"><?php echo $error_restrictions_insp; ?></div>  <?php } ?>
 <?php if ($error_restrictions_fri) { ?>  <div class="attention"><?php echo $error_restrictions_fri; ?></div>  <?php } ?>
 <?php if ($error_restrictions_cfri) { ?>  <div class="attention"><?php echo $error_restrictions_cfri; ?></div>  <?php } ?>
 <?php if ($warning_routed) { ?>  <div class="attention"><?php echo $warning_routed; ?></div>  <?php } ?>
  
  <?php if ($success) { ?> <div class="success"><?php echo $success; ?></div><?php } ?>
 
      
       <h3 >               
	    <?php if ($bookingnumber) { ?>  <?php echo $bookingnumber; ?> <?php if ($service_portofloading_code) { ?><?php echo $service_portofloading_code; ?><?php } ?>
	    <?php if ($service_portofdest_code) { ?><?php echo $service_portofdest_code; ?> <?php } ?>  |<?php } ?> 
	    <?php if ($bookingdate) { ?>  <?php echo $entry_bookingdate; ?> <?php echo $bookingdate; ?> | <?php } else { ?><input type="hidden"  name="bookingdate" value="<?php echo date("m-d-Y"); ?>"/><?php } ?>
	    <?php if ($bookedby) { ?>  <?php echo $entry_bookedby; ?> <?php echo $bookedby;?>  |<?php } ?>
	    <?php if ($status) { ?> Status: <?php echo $status; ?>  <?php } ?>  
	  </h3>
	  </div>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>  
       <div class="panel-body">
       <form class="form"  id='formId' role="form" method="post" action="<?php echo $action; ?>">
        <div class="form-group">
        
      	 <div class="row">
      	  <div class=".col-lg-4 col-md-4 col-sm-6"><?php echo $customer_data; ?></div>
	      <div class=".col-lg-5 col-md-5 col-sm-6"><?php echo $service_details; ?></div>
	      <div class=".col-lg-3 col-md-3 col-sm-6"><?php echo $commodity_details; ?></div>
	     </div>
	    
	    <div class="row" >
	    	 <div class=".col-lg-2 col-md-2 col-sm-2" >	
	    		 <i class="fa fa-flag"></i> Booking Types:<br>
	    		 <table class="bordered" >
			 <tr>
			 
              	<td></td>
             </tr><tr>
 		      
         <?php if ($Bkcold=='C') { ?>
   <td style="padding-left: 1cm;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="coload" name="Bkcold" value="C" checked="checked"> <?php echo $entry_coload; ?></td>
  </tr><tr>
   <td style="padding-left: 1cm ;text-align: left"><label class="radio" onclick = "document.location.href='index.php?route=service/booking/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></td>
  </tr><tr>   
   <td style="padding-left: 1cm ;text-align: left"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" > <?php echo $entry_shipper; ?></label></td>
  </tr><tr>    
   <td style="padding-left: 1cm ;text-align: left"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="false" > <?php echo $entry_personaleffects; ?></label></td>
        <?php } elseif ($Bkcold=='F'){ ?>
    <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="C"> <?php echo $entry_coload; ?></label></td>
   </tr><tr>	    
  <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/booking/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" checked="checked"> <?php echo $entry_forward; ?></label></td>
   </tr><tr>    
   <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" > <?php echo $entry_shipper; ?></label></td>
    </tr><tr>    
   <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="false" > <?php echo $entry_personaleffects; ?></label></td>
                
        <?php } elseif ($Bkcold=='S' && $personaleffects == 'false'){ ?>
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();">
            	    <input type="radio" id="Bkcold" name="Bkcold" value="C"><?php echo $entry_coload; ?></label></td>
            </tr><tr>	    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/booking/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></label></td>
            </tr><tr>    
               <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" checked="checked"> <?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="false" > <?php echo $entry_personaleffects; ?></label></td>
     
        	              
	<?php } elseif ($personaleffects == 'true') { ?>   
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();">
            	    <input type="radio" id="Bkcold" name="Bkcold" value="C"><?php echo $entry_coload; ?></label></td>
            </tr><tr>	    
               <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/booking/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></label></td>
            </tr><tr>    
               <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" > <?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="true" checked="checked"> <?php echo $entry_personaleffects; ?></label></td>
              
   <?php } else { ?>
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="C" > <?php echo $entry_coload; ?></label></td>
            </tr><tr>    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/booking/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></label></td>
            </tr><tr>    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" > <?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
               <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="true" > <?php echo $entry_personaleffects; ?></label></td>

         <?php } ?>
	
			</tr>	
			</table>
		</div>	
	    	 	
	    	 <div class=".col-lg-3 col-md-3 col-sm-3 well" >	
	    	 	
		 <table class="" >		
	
		    <tr><td><b>Options: </b></td></tr>
            <tr><td><label>
    <?php if ($pickup == "true") { ?>
			  <input type="checkbox" id="pickup" name="pickup" checked="checked"  onclick = "document.location.href='index.php?route=service/booking/clearTrucking&token=<?php echo $token; ?>'" onchange="showHide()" > <?php echo $entry_pickup; ?>
	<?php } else { ?>
	<input type="checkbox" id="pickup" name= "pickup"  onclick = "document.location.href='index.php?route=service/booking/clearTrucking&token=<?php echo $token; ?>'" onchange="showHide()" > <?php echo $entry_pickup; ?>
	<?php } ?>
			  </label>
			  </td>
			  
	        </tr>
	        
	        <tr><td><label> 
	 <?php if ($destination_service  == "true"  ){ ?>
	        <input type="checkbox"  checked="checked"  onchange="self.location=self.location;showHide();" id="destination_service" name="destination_service"   > Destination Service
         	</tr>
         	<tr> 	  
	          <td >
		         		
			         	  <table>
			         	  <tr>
			         	  <div class="btn-group radio">
		<?php if ($doormove  == "true" ){ ?>
	<label class="radio" onchange="showHide();"><input type="radio" id="doormove" name="doormove" checked="checked" onchange="showHide();" /> Door Move</label>
	<label class="radio" onchange="showHide();"><input type="radio" id="delivery" name="doormove" value="false" onchange="$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'delivery','value':'true'} );showhide();"  /> Delivery</label>
	<label class="radio" onchange="showHide();"><input type="radio" id="nodelivery" name="doormove" value="false" onchange="$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'delivery','value':'false'} );showhide();" /> None</label>
		<?php }else if ($delivery  == "true"){ ?>
	<label class="radio" onchange="showHide();"><input type="radio" id="doormove" name="doormove" value="true"  onchange="showHide();" /> Door Move</label>
	<label class="radio" onchange="showHide();"><input type="radio" id="delivery" name="doormove"  checked="checked" onchange="$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'delivery','value':'false'} );showhide();"  value="false"  /> Delivery</label>
	<label class="radio" onchange="showHide();"><input type="radio" id="nodelivery" name="doormove" onchange="$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'delivery','value':'false'} );showhide();"   value="false"  /> None</label>
		<?php } else {?>
	<label class="radio" onchange="showHide();"><input type="radio" id="doormove" name="doormove" value="true" onchange="showHide();" /> Door Move </label>
	<label class="radio" onchange="showHide();"><input type="radio" id="delivery" name="doormove"  value="false" onchange="$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'delivery','value':'true'} );showhide();"   /> Delivery </label>
	<label class="radio" onchange="showHide();"><input type="radio" id="nodelivery" name="doormove"  checked="checked" onchange="$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'delivery','value':'false'} );showhide();"   /> None </label>
	    <?php } ?>
	    				 </div>
	    				 
			         	  </tr>
	<tr><td ><label>
                
      <?php if ($service_decaes=='Y') { ?><b>DEC/AES Filing by TCL</b><?php } ?>
      <?php if ($service_decaes=='C') { ?><b>DEC/AES Filing by Customer</b><?php } ?>
      <?php if ($service_decaes=='N') { ?><b>AES Filing - No Ex-Dec Required</b><?php } ?>
    </td></tr>
    <tr><td><label>
     <?php if ($destdocs=='true') { ?>
                <input type="checkbox" checked="checked" id="destdocs" name= "destdocs"  > Destination Docs
     <?php }else { ?>
                <input type="checkbox" id="destdocs" name= "destdocs"  > Prepare Destination Docs
     <?php } ?>
     			</label></td>
     			</tr>
     			
     			<tr><td>
         		<label>
     <?php if ($customs=='true') { ?>
         		<input type="checkbox" checked="checked" id="customs" name= "customs"  > Customs Clearance Services
     <?php }else { ?>
         		 <input type="checkbox" id="customs" name= "customs" > Customs Clearance Services
     <?php } ?>
         		 </label></td>
              	</tr>
              	
				<tr>
				<td>
         		 <label>
         		
      <?php if ($thc=='true') { ?>
         		<input type="checkbox" checked="checked" id="thc" name= "thc"  > Terminal Handling Charges
      <?php }else { ?>
         		<input type="checkbox" id="thc" name="thc"  > Terminal Handling Charges
      <?php } ?>
     			 </label></td>
             	 </tr>
     
      <?php } else{ ?>
			 <input type="checkbox"  onchange="self.location=self.location;showHide();" id="destination_service" name="destination_service"   > Destination Service
         		</td>
						  </tr>
	 <?php } ?>
	 

	   </table>  	 	
		 
	         		 
         		  </td>
         		</tr>   
         		  	
	  </table>  	 	
		
		  </div>	
	    	 	
	    	 <div class=".col-lg-3 col-md-3 col-sm-3" >	
	    	 
		   <table class="table table-bordered">
		    <thead><tr><td>Routing: </td></tr></thead>
		   	 <?php if ($Bkcold=='F'){ ?>
	        <tr><td>
	    <tbody id="brokerage_hidden" name="brokerage_hidden" style="">
			 <tr> 	  
                <td ><label> 
      <?php if ($brokerage=='true') { ?>   
                <input type="checkbox" checked="checked" id="brokerage" name= "brokerage" value="" onchange="showHide()"> <?php echo $entry_brokerage; ?>
      <?php }else { ?>
                <input type="checkbox" id="brokerage" name= "brokerage" value="" onchange="showHide()"> <?php echo $entry_brokerage; ?>	    
      <?php } ?>  
      		 </label></td>	
             </tr>
               
	  <?php if ($forwardadvance=='true' || $custaddon == 'true' ) { ?>
	              	<tr> 
	                <td ><label><input checked="checked" type="checkbox" id="forwardadvance" name= "forwardadvance"  > Forwarder Advance</label></td>
	                </tr>
	  <?php }else { ?>
	                 <tr> 	  
               		 <td ><label><input type="checkbox" id="forwardadvance" name= "forwardadvance"> Forwarder Advance</label></td>
             		 </tr>
	  <?php } ?>
         </tbody>
         	</td></tr>
	            <?php } ?>        
	 			<tr> 
			  <td ><label>
			  
	  <?php if ($routedcargo  == "true") { ?>
			  <input type="checkbox" id ="routedcargo" name="routedcargo" value="" checked="checked" onchange="self.location=self.location;showHide();"> <?php echo $entry_routedcargo; ?></label></td>
      <?php } else { ?>
              <input type="checkbox"  id ="routedcargo" name="routedcargo" value="" onchange="self.location=self.location;showHide();"> <?php echo $entry_routedcargo; ?>
      <?php } ?>
              	  </label></td>
              </tr>
              
              <tr> 
			  <td ><label>
	  <?php if ($bkbtob  == "true") { ?>
			  <input type="checkbox" id ="bkbtob" name="bkbtob" value="" checked="checked" onchange="self.location=self.location;showHide();"> Manual Back-to-Back</label></td>
      <?php } else { ?>
              <input type="checkbox"  id ="bkbtob" name="bkbtob" value="" onchange="self.location=self.location;showHide();"> Manual Back-to-Back</label> </label></td>
      <?php } ?>
              </tr>
      <?php if ($hazardous  == "true") { ?>	
	         <tr> 
			  <td><label>
			  <input type="checkbox" id = "hazardous" name="hazardous" checked="checked"  onchange="self.location=self.location;showHide();"> <?php echo $entry_hazardous; ?>
              </label></td>
             </tr>
               
          </table>
		<div class="row">
		 <table class="table">
             <tr>
		
			 <td><span class="required">&nbsp;</span> <?php echo $entry_hazclass; ?></td>
			 <td></td>
			 <td></td>
			 
			 <td> <?php echo $entry_un; ?></td>
		     <td> <?php echo $entry_commodity_hazardous_approval; ?></td>
		
			 </tr>
			 <tr>
		
		     <td><input type="text" placeholder="3,8,9" id="hazclass1" name="hazclass1" value="<?php echo $hazclass1; ?>" size="5" /></td>
		     <td><input type="text" placeholder="3,8,9" id="hazclass2" name="hazclass2" value="<?php echo $hazclass2; ?>" size="5" /></td>
		     <td><input type="text" placeholder="3,8,9" id="hazclass3" name="hazclass3" value="<?php echo $hazclass3; ?>" size="5" /></td>
		
		     <td><input type="text" placeholder="UN" id="un" name="un" value="<?php echo $un; ?>" size="5" /></td>
		     <td><input type="text" placeholder="" id="commodity_hazardous_approval" name="commodity_hazardous_approval" disabled="disabled" value="<?php echo $commodity_hazardous_approval; ?>" onchange="<?php echo $updateSession; ?>" size="6" /></td>
		
	    	 </tr>
	    	 
	    </table>
          </div>     
	      
      <?php } else { ?>
              <tr> 
			  <td><label>
              <input type="checkbox"  id = "hazardous" name="hazardous" onchange="self.location=self.location;showHide();"> <?php echo $entry_hazardous; ?>
               </label></td>
             </tr>	  
            
     <?php } ?>     
         
     </table>
	    	 	
	    	 
	    	 </div>
	    	<div class="row"> 
		      <div class=".col-lg-1 col-md-1 col-sm-6"></div>
		      <div class=".col-lg-3 col-md-3 col-sm-6">
		      	
			      <div class="row"><label class="col-sm-8" for=""><?php echo $column_rates; ?></label></div>
			      <div class="row">
			      	<div class="form-group">
		                  <div class="col-sm-12">
		                    <div class="input-group">
		                      <input type="text" readonly="readonly" id="sum2" name="sum2" value="<?php echo $total; ?>" class="form-control" />
		                      <span class="input-group-btn">
		                      <a type="button" id="button-rates" data-toggle="tooltip" href="<?php echo $update_rates; ?>" title="<?php echo $button_rates; ?>" data-loading-text="<?php echo $text_rates; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></a>
		                      </span>
		                     </div>
		                  </div>
		             </div>
		          </div>
		          
		          <div class="row"> <div class="col-sm-11 col-sm-offset-1"><?php echo $text_estimate; ?></div>
			  </div>
			  
			  </div> 
		     <div class=".col-lg-4 col-md-4 col-sm-6 dimensions">
		    <a onclick="displayDims();"><i class="fa fa-cube"></i> Dimensions
		    </a> 
			    <div id="dimensions_hidden" style="display:none">
					 <table id="dim" class="table table-striped table-bordered table-hover">
			            <thead>
			              <tr>
			             	
			                <td class="text-left">Length</td>
			                <td class="text-left">Width</td>
			                <td class="text-left">Height</td>
			                <td class="text-center">= Cube</td>
			                <td></td>
			              </tr>
			            </thead>
			            <tbody>
			              	<?php $dim_row = 0; ?>
			              <?php foreach ($dimensions as $dimension) { ?>
              <tr id="dimension-row<?php echo $dim_row; ?>">
               <td class="text-left"><input type="text" name="dimension[<?php echo $dim_row; ?>][length]" value="<?php echo $dimension['length']; ?>" class="form-control length" onChange="if(document.getElementByName('dimension[<?php echo $dim_row; ?>][length]').value==null) {cube=(document.getElementByName('dimension[<?php echo $dim_row; ?>][length]').value * document.getElementByName('dimension[<?php echo $dim_row; ?>][width]').value * document.getElementByName('dimension[<?php echo $dim_row; ?>][height]').value)/1728; document.getElementById(cube[<?php echo $dim_row; ?>]).value=cube.toFixed(1)};"/></td>
               <td class="text-left"><input type="text" name="dimension[<?php echo $dim_row; ?>][width]" value="<?php echo $dimension['width']; ?>" class="form-control width"/></td>
			   <td class="text-left"><input type="text" name="dimension[<?php echo $dim_row; ?>][height]" value="<?php echo $dimension['height']; ?>" class="form-control height"/></td>
			   <td class="text-right" id="cube[<?php echo $dim_row; ?>]"></td>
               <td class="text-left"></td>
			 </tr>
			               <?php $dim_row++; ?>
              			<?php } ?>		    	
						 </tbody>
						 <tfoot>
              <tr>
                <td class="text-center" id ="length_total"></td>
                <td class="text-center" id ="width_total"></td>
                <td class="text-center" id ="height_total"></td>
                <td id ="dim_total" name="dim_total"></td>
                <td class="text-right"><button type="button" onclick="addDimension();" data-toggle="tooltip" title="<?php echo $button_dimension_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
              <tr><td colspan ="5"  class="text-center"> - inches to cubic feet -</td></tr>
            </tfoot>
					</table>

			    </div>
		    </div>
			      
		      </div> 
	    </div>
  </div>     
        
   <ul id="order" class="nav nav-tabs nav-justified">
            <li class="active"><a href="#tab-rates" data-toggle="tab"><?php echo $tab_rates; ?></a></li>
    <?php if ($pickup  == "true") { ?>       
            <li class="" id="trucking_tab"><a href="#tab-trucking" data-toggle="tab"><?php echo $tab_trucking; ?></a></li>
      <?php } else { ?>
    		<li class="" id="trucking_tab" style="display:none;"><a href="#tab-trucking" data-toggle="tab"><?php echo $tab_trucking; ?></a></li>
    <?php } ?>        
            <li class=""><a href="#tab-costs" data-toggle="tab"><?php echo $tab_costs; ?></a></li>
    <?php if ($receipt_receipt) { ?>     
            <li class="" id="receipt_tab" ><a href="#tab-receipts" data-toggle="tab"><?php echo $tab_receipts; ?></a></li>
     <?php } else { ?>
      		<li class="" id="receipt_tab" style="display:none;" ><a href="#tab-receipts" data-toggle="tab"><?php echo $tab_receipts; ?></a></li>
      <?php } ?>        
    <?php if ($hazardous  == "true") { ?>
			<li class=""><a href="#tab-hazardous" data-toggle="tab"><?php echo $tab_hazardous; ?></a></li>
    <?php } else { ?>
	   		<li class="" style="display:none;"><a href="#tab-hazardous" data-toggle="tab"><?php echo $tab_hazardous; ?></a></li>
	<?php } ?>
			<li class=""><a href="#tab_approvals" data-toggle="tab"><?php echo $tab_approvals; ?></a></li>
            <li class=""><a href="#tab_notes" data-toggle="tab"><?php echo $tab_notes; ?></a></li>
            <li class=""><a href="#tab-tracking_log" data-toggle="tab"><?php echo $tab_tracking_log; ?></a></li>
            
    <?php if ($combined_info) { ?>   
            <li class=""><a href="#tab_combined" data-toggle="tab"><?php echo $tab_combined; ?></a></li>
    <?php } ?>
   </ul>
         
   <div class="tab-content">
	<div class="tab-pane active" id="tab-rates">
	<legend><?php echo $text_rates; ?></legend>
	<div class=".col-lg-6 col-md-6 col-sm-6">
       <div class ="table-responsive">
      	<table class="table table-bordered">
      	
      		<thead>
	        <tr>
              <td><?php echo $entry_rateitem; ?></td>
              <td> <?php echo $entry_rate; ?> </td>
              <td><?php echo $entry_minflat; ?></td>
              <td><?php echo $entry_amount; ?></td>
            </tr>
            </thead>
<!--- // Rates calc or entered // --->            
			<tbody>
            
            <?php if ($rates_oceanfreight) { ?>
            
            <tr>
              <td><?php echo $entry_rates_oceanfreight; ?></td>
              <td><input type="text" placeholder="$0.00" id ="rates_oceanfreight" name="rates_oceanfreight" value="<?php echo $rates_oceanfreight; ?>"  class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id ="rates_oceanfreight_min" name="rates_oceanfreight_min" value="<?php echo $rates_oceanfreight_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this,'tot');" placeholder="$0.00" id="rates_oceanfreight_amount" name="rates_oceanfreight_amount" value="<?php echo $rates_oceanfreight_amount; ?>" /></td>
            
            </tr>		
        
            <?php }else ?>
            
             <?php if ($rates_thc && $rates_thc >'0.00'||$thc == 'true') { ?>
            	 <tr>
              <td><?php echo $entry_rates_thc; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_thc"  name="rates_thc" value="<?php echo $rates_thc; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_thc_min" name="rates_thc_min" value="<?php echo $rates_thc_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_thc_amount" value="<?php echo $rates_thc; ?>" /></td>
            </tr>    
             <?php }else ?>
             
            <?php if ($rates_baf && $rates_baf>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_baf; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_baf" name="rates_baf" value="<?php echo $rates_baf; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_baf_min" name="rates_baf_min" value="<?php echo $rates_baf_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_baf_amount" name="rates_baf_amount" value="<?php echo $rates_baf_amount; ?>" /></td>
            </tr>
            <?php }else ?>
            
            <?php if ($rates_chassissurcharge && $rates_chassissurcharge>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_chassissurcharge; ?></td>
              <td><input type="text" placeholder="$0.00" name="rates_chassissurcharge" value="<?php echo $rates_chassissurcharge; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" name="rates_chassissurcharge_min" value="<?php echo $rates_chassissurcharge_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_chassissurcharge_amount" value="<?php echo $rates_chassissurcharge_amount; ?>"  /></td>
            </tr> 
            <?php }else ?>
            
            <?php if (($rates_hazardous && $rates_hazardous>'0.00') || $rates_hazardous_min >'0.00'  ) { ?>
            <tr>
              <td><?php echo $entry_rates_hazsurcharge; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_hazardous" name="rates_hazardous" value="<?php echo $rates_hazardous; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_hazardous_min"  name="rates_hazardous_min" value="<?php echo $rates_hazardous_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_hazardous_amount" name="rates_hazardous_amount" value="<?php echo $rates_hazardous_amount; ?>" /></td>
            </tr>
            <?php }else ?>
            
              <?php if (($rates_precarriage) && $rates_precarriage>'0.00'|| ($truckingrate) &&$truckingrate>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_precarriage; ?></td>
              <td><input type="text" placeholder="$0.00" id ="rates_precarriage" name="rates_precarriage" value="<?php echo $rates_precarriage; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" name="rates_precarriage_min" value="<?php echo $rates_precarriage_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_precarriage_amount" name="rates_precarriage_amount"  value="<?php echo $rates_precarriage_amount; ?>"/></td>
            </tr>
            <?php }else ?>
            
             <?php if ($rates_fuelsurcharge && $rates_fuelsurcharge >'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_fuelsurcharge; ?></td>
              <td><input type="text" placeholder="0" name="rates_fuelsurcharge" value="<?php echo $rates_fuelsurcharge; ?>" class="form-control" /></td>
              <td>%</td>
              <td><input disabled = "disabled" class="txt form-control" type="text" placeholder="$0.00" name="rates_fuelsurcharge_amount" value="<?php echo $rates_fuelsurcharge_amount; ?>"  /></td>
            </tr>
             <?php }else ?>
            
             <?php if ($rates_forwarderadvance) { ?>
            <tr>
              <td><?php echo $entry_rates_forwarderadvance; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" onchange="self.location=self.location" name="rates_forwarderadvance" value="<?php echo $rates_forwarderadvance; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text"onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_forwarderadvance_amount" value="<?php echo $rates_forwarderadvance; ?>" /></td>
            </tr> 
            <?php }else ?>
            
           
            <?php if ($rates_bolfee_min && $rates_bolfee_min>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_bolfee; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_bolfee_min" value="<?php echo $rates_bolfee_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_bolfee_amount" value="<?php echo $rates_bolfee_amount; ?>" /></td>
            </tr>
            <?php }else ?>
            
            <?php if ($rates_eufilingfee_min && $rates_eufilingfee_min>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_eufilingfee; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_eufilingfee_min" value="<?php echo $rates_eufilingfee_min; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_eufilingfee_amount" value="<?php echo $rates_eufilingfee; ?>"  /></td>
            </tr>
            <?php }else ?>
            
          
            <?php if ($customs == 'true' && $rates_customsclearance >'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_customsclearance; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_customsclearance" id="rates_customsclearance" value="<?php echo $rates_customsclearance; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_customsclearance_amount" name="rates_customsclearance_amount" value="<?php echo $rates_customsclearance_amount; ?>"  /></td>
            </tr> 
            <?php }else ?>
            
             <?php if ($rates_oncarriage && $rates_oncarriage>'0.00' || ($doormove =='true'||$delivery=='true')) { ?>
            <tr>
              <td><?php echo $entry_rates_oncarriage; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_oncarriage" id="rates_oncarriage" value="<?php echo $rates_oncarriage; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_oncarriage_amount" name="rates_oncarriage_amount" value="<?php echo $rates_oncarriage_amount; ?>" /></td>
            </tr>
             <?php }else ?>
             
            <?php if ($destdocs=='true') { ?>
            <tr>
              <td><?php echo $entry_rates_destdocs; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00"  id="rates_destdocs" name="rates_destdocs" value="<?php echo $rates_destdocs; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_destdocs_amount"  id="rates_destdocs_amount" value="<?php echo $rates_destdocs_amount; ?>" /></td>
            </tr>
            <?php }else ?>
            
            <?php  if ($service_decaes == "true" ||  $rates_aesfilingbytcl > 0.01) { ?>
            <tr>
              <td><?php echo $entry_rates_aesfilingbytcl; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_aesfilingbytcl" name="rates_aesfilingbytcl" value="<?php echo $rates_aesfilingbytcl; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" placeholder="$0.00" onblur="calcTotal(this, 'tot')" id="rates_aesfilingbytcl_amount"  name="rates_aesfilingbytcl_amount" value="<?php echo $rates_aesfilingbytcl; ?>"  /></td>
            </tr> 
             <?php }else  ?>
             
             <?php if ($rates_docsreqd && $rates_docsreqd > '0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_docsreqd; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_docsreqd" value="<?php echo $rates_docsreqd; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')"  placeholder="$0.00" id="rates_docsreqd_amount" name="rates_docsreqd_amount" value="<?php echo $rates_docsreqd_amount; ?>" /></td>
            </tr> 
             <?php }else ?>
             
            <?php if ($rates_wgtsurcharge && $rates_wgtsurcharge >'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_wgtsurcharge; ?></td>
              
              <td><input type="text" placeholder="$0.00" name="rates_wgtsurcharge" id="rates_wgtsurcharge"  value="<?php echo $rates_wgtsurcharge; ?>" class="form-control" /></td>
              <td></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_wgtsurcharge_amount" name="rates_wgtsurcharge_amount" value="<?php echo $rates_wgtsurcharge_amount; ?>"  /></td>
            </tr> 
            <?php }else ?>
            
             
                       
            <?php if ($rates_line_haul && $rates_line_haul >'0.00') { ?>
            <tr>
            	<td><?php echo $entry_linehaul; ?></td> 
                <td><input type="text" placeholder="$0.00" id="rates_line_haul" name="rates_line_haul" value="<?php echo $rates_line_haul; ?>" class="form-control" /></td>
              	<td><input type="text" placeholder="$0.00" id="rates_line_haul_min" name="rates_line_haul_min" value="<?php echo $rates_line_haul_min; ?>" class="form-control" /></td>
              	<td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_line_haul_amount" value="<?php echo $rates_line_haul_amount; ?>" /></td>
            </tr>    
            <?php } ?>
                  
           
            
            <tr>
              <td><input type="text" placeholder="(Flat)" id="entry_other2" name="entry_other2" value="<?php echo $entry_other2; ?>" class="form-control" /></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_other2" name="rates_other2" value="<?php echo $rates_other2; ?>" class="form-control" /></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_other2_amount" value="<?php echo $rates_other2; ?>"  /></td>
            </tr>
             
            <tr>
              <td><input type="text" placeholder="(W/M Rate)" id="entry_other4" name="entry_other4" value="<?php echo $entry_other4; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00"  id="rates_other4" name="rates_other4" value="<?php echo $rates_other4; ?>" class="form-control"  /></td>
              <td><?php echo $rates_other4; ?></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_other4_amount"  name="rates_other4_amount" value="<?php echo $rates_other4_amount; ?>"  /></td>
            </tr>
            <?php if ($rates_other3 !=null && $rates_other3 > '0.00' ) { ?>
            <tr>
              <td><input type="text" placeholder="(W/M Rate)" id="entry_other3" name="entry_other3" value="<?php echo $entry_other3; ?>" class="form-control"/></td>
             
              <td><input type="text" placeholder="$0.00" id="rates_other3" name="rates_other3" value="<?php echo $rates_other3; ?>" class="form-control" /></td>
               <td><?php echo $rates_other3; ?></td>
              <td><input disabled = "disabled" class="txt form-control" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_other3_amount" name="rates_other3_amount" value="<?php echo $rates_other3_amount; ?>"  /></td>
            </tr>
             <?php } ?>
           <tr id="summation">
			        <td>&nbsp;</td>
			        <td colspan = "2">Est. Total (Based on Pcs/Wgt/Cube):</td>
			        <td class="total" align="left">$<span id="sum">0</span></td>
			    </tr>
			    </tbody>			        
            </table>
	
           
            
            </div>
            </div>
            <div class=".col-lg-6 col-md-6 col-sm-6">
             <div class ="table-responsive">
             <table class="table table-bordered">
      		
				<tr>
				<td>
				<?php if ($service_portofdest_charge == 'true') { ?>	
				<input type="checkbox" name = "service_portofdest_charge" id= "service_portofdest_charge" checked="checked"> Show Destination Charges
			<?php }else { ?>	
				<input type="checkbox" name = "service_portofdest_charge" id= "service_portofdest_charge" > Show Destination Charges
			<?php } ?>
				<?php if ($personaleffects == 'true') { ?>
				<input type="checkbox" name = "" > Show PE /Cft
				<?php } ?>
				</td></tr>
				<tr>
		<?php if ($agent_dest_charges) { ?>	
				
			<?php if ($agent_clause) { ?>	
				<td><?php echo nl2br($agent_clause); ?></td></tr><tr>
			<?php } ?>
			<?php if ($agent_pechg) { ?>	
				<td>DIRECT CONSIGNMENT: <?php echo nl2br($agent_pechg); ?></td></tr><tr>
			<?php } ?>
			<?php if ($agent_forward) { ?>	
				<td>COLOAD/FREIGHT FORWARDER: <?php echo nl2br($agent_forward); ?></td></tr><tr>
			<?php } ?>
		<?php } ?>	
			
			<?php if ($service_portofdest_agent_charge) { ?>	
				<td><?php echo $service_portofdest_agent_charge; ?></td></tr><tr>
			<?php } ?>
			<?php if ($service_portofdest_agent_personal) { ?>	
				<td>DIRECT CONSIGNMENT: <?php echo nl2br($service_portofdest_agent_personal); ?></td></tr><tr>
			<?php } ?>
			<?php if ($service_portofdest_agent_forward) { ?>	
				<td>COLOAD/FREIGHT FORWARDER: <?php echo nl2br($service_portofdest_agent_forward); ?></td></tr><tr>
			<?php } ?>
			    </tr>
				
				</table>	
				 </div>
				 </div>
				 <!--"booking-content" -->
			
        </div><!-- end "rates-booking" -->
   
   <div class="tab-pane" id="tab-trucking" >
		<div class ="trucking">
  			<div class=".col-lg-4 col-md-4 col-sm-4"><?php echo $trucker_details; ?></div>
  			<div class=".col-lg-4 col-md-4 col-sm-4"><?php echo $pickup_details; ?></div>
  			<div class=".col-lg-4 col-md-4 col-sm-4"><?php echo $cts_details; ?></div>
   		</div><!-- end "trucking-pickup" -->
	</div><!-- end tab content-->		
   <div class="tab-pane" id="tab-costs" >
		<div class ="costs">
			<div class=".col-lg-12 col-md-12 col-sm-12"><?php echo $costs_details; ?></div>
		</div><!--"costs -content" -->
	</div><!-- end tab content-->		
	
   <div class="tab-pane" id="tab-receipts" >
		<div class ="receipts">
			<div class=".col-lg-12 col-md-12 col-sm-12"><?php echo $receipts_details; ?></div>
		</div><!--"receipts -content" -->
	</div><!-- end tab content-->
	
   <div class="tab-pane" id="tab-hazardous" >
		<div class ="hazardous">
			<div class=".col-lg-12 col-md-12 col-sm-12"><?php echo $hazardous_details; ?></div>
		</div><!--"hazardous-content" -->
	</div><!-- end tab content-->	
   
   <div class="tab-pane" id="tab_notes" >
    	<div class="tab_notes">
    		<div class=".col-lg-12 col-md-12 col-sm-12"><?php echo $notes_details; ?></div>	
    	</div><!--"notes-content" -->   		
	</div><!-- end tab content-->
	
	
		<div class="tab-pane" id="tab_combined" >
     <div class="tab_combined">
	    <div class=".col-lg-12 col-md-12 col-sm-12">
	    
	   		 <?php if ($combined_info) { 
					
					echo"<h3>The following bookings were combined into Booking number <b>".$combined_info[0]["item"]."</b></h3><br> ";
					echo "<table class='table table-bordered' bgcolor='#FFFFFF' >";	
					echo "<tr bgcolor='#F5F5DC' border ='0'><td>Pieces </td><td>Booking</td><td>Weight</td><td>Cube</td><td>Commodity</td></tr>";				
					for ($row = 0; $row < sizeof($combined_info); $row++){	
					echo "<tr>";
										
					echo "<td> ".$combined_info[$row]["bkpcs"]."</td><td>";

					
					if ($combined_info[$row]["item"] == $bookingnumber){
					echo " ".$combined_info[$row]["item"]." ";
				

					echo " (You are currently accessing this Booking)";
					} else {
					echo "<a href='index.php?route=service/booking/update&token=";
					echo "".$token."&booking_no=".$combined_info[$row]["item"]."'> ".$combined_info[$row]["item"]."</a> ";
				
					}

					echo "</td><td>".number_format($combined_info[$row]["BKWgtE"],0)."</td><td>".number_format($combined_info[$row]["BKCubE"],0)."</td><td>".$combined_info[$row]["BkComm"]."</td>";
					echo "<tr/>";
					}
						
					echo "</table>";
								
			  	}else{ ?>	
					<table><tr>
					<td>
						No Results!</textarea>
					</td>
					</tr>	
					</table>
				<?php } ?>
	    
	    </div>
	    	
    </div><!--"tab_combined" --> 
     		
	</div><!-- end tab content-->
	
    <div class="tab-pane" id="tab-tracking_log" >
	    <div class="tracking_log">
	   		 <div class=".col-lg-12 col-md-12 col-sm-12"><?php echo $tracking_details; ?></div>
	    </div><!--"tracking-content" -->   		
	</div><!-- end tab content-->
	
		
	</div><!-- end tab content-->	
			</form>
		</div><!-- end panel body-->	
	</div><!-- end panel-->

 </div><!-- end tab content -->
 
 
 
 
 </div><!-- end container-->   
 

<script type="text/javascript">function showHide() {
    	if(document.getElementById("hazardous").checked)	{
   		 document.getElementById("hazardous_hidden").style.display = ""
   		 document.getElementById("hazardous_tab").style.display = ""; 
   			}
    	else {
    	 document.getElementById("hazardous_hidden").style.display = "none"
    	 document.getElementById("hazardous_tab").style.display = "none"; 
    	 	}
        if(document.getElementById("routedcargo").checked)	{ 
    	 document.getElementById("routedcargo_hidden").style.display = "";
    	   }
    	 else { 
    	    document.getElementById("routedcargo_hidden").style.display = "none";	
    	 	}
    	 	 	 	
    	if(document.getElementById("pickup").checked)	{
    	 document.getElementById("readydate_hidden").style.display = ""
    	 document.getElementById("pickup_hidden").style.display = ""
    	 document.getElementById("trucking_hidden").style.display = ""
   		 document.getElementById("tab-trucking").style.display = ""
   		 document.getElementById("trucking_tab").style.display = ""
   		 document.getElementById("cts_button").style.display = "";  
   		 
   			}
    	else {
    	 document.getElementById("readydate_hidden").style.display = "none"
    	 document.getElementById("pickup_hidden").style.display = "none"
    	 document.getElementById("trucking_hidden").style.display = "none"
    	 document.getElementById("tab-trucking").style.display = "none"
    	 document.getElementById("trucking_tab").style.display = "none"
    	 document.getElementById("cts_button").style.display = "none";	
    	 	} 	
    	if(document.getElementById("forwardadvance").checked)	{
    	 document.getElementById("forwardadvance_hidden").style.display = "";
    	 	}
    	 else { 
    	 	document.getElementById("forwardadvance_hidden").style.display = "none";	
    	 	}
    	if(document.getElementById("doormove").checked)	{
    		document.getElementById("pod").style.display = "";
    	}
    	if(document.getElementById("delivery").checked)	{
    		document.getElementById("pod").style.display = "";
    	}
    	
    		 	    	    	 	
   	 } 

	function displayDims() {$("#dimensions_hidden").toggle(); };
//--></script>


<script type="text/javascript">$("input[name=rates_wgtsurcharge]").change(function(){
	var rates_wgtsurcharge = $("#rates_wgtsurcharge").val();
	$.post("controller/setting/ajaxpersist.php", {"fieldname" : "rates_wgtsurcharge","value":rates_wgtsurcharge});
	$("input[name=\"rates_wgtsurcharge\"]").val(rates_wgtsurcharge);
	});
</script>
<script type="text/javascript">$("input[name=ApprovePassword]").change(function(){
	var ApprovePassword = $("#ApprovePassword").val();
	var wrongPWD = $("#error_nocommodity_weight").val();
	if (ApprovePassword == <?php echo $token; ?>){
		var commodity_density_approved = $("#commodity_density_approved").val();
		$.post("controller/setting/ajaxpersist.php", {"fieldname" : "commodity_density_approved","value":commodity_density_approved});
		$("input[name=\"commodity_density_approved\"]").val(commodity_density_approved);
		} else{
		$.post("controller/setting/ajaxpersist.php", {"fieldname" : "error_nocommodity_weight","value":"error_nocommodity_weight"+" Password is Incorrect!"});

	}});
</script>
<!--/Sum fields/-->
<script type="text/javascript">$(document).ready(function() {var rates_oceanfreight = $("input[name=rates_oceanfreight]").val();
	var rates_oceanfreight_min = $("input[name=rates_oceanfreight_min]").val();	
	var rates_oceanfreight_min2 = parseFloat(rates_oceanfreight_min);
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(rates_oceanfreight)||0;
	if (ocean_sum<rates_oceanfreight_min2){ocean_sum = rates_oceanfreight_min2};
	var ocean_sum = ocean_sum.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_oceanfreight_amount','value':ocean_sum});
	$('input[name=\'rates_oceanfreight_amount\']').val(ocean_sum);});
		
	$("input[name=rates_oceanfreight]").change(function(){
		var rates_oceanfreight =$("#rates_oceanfreight").val();
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_oceanfreight', 'value':rates_oceanfreight});
		$('input[name=\'rates_oceanfreight\']').val(rates_oceanfreight);
		});
	
	$("input[name=rates_oceanfreight_min]").change(function(){
		var rates_oceanfreight_min =$("#rates_oceanfreight_min").val();
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_oceanfreight_min', 'value':rates_oceanfreight_min});
		$('input[name=\'rates_oceanfreight_min\']').val(rates_oceanfreight_min);
		});
</script>
<script type="text/javascript">$(document).ready(function() {var eufilingfee = $("input[name=rates_eufilingfee]").val();
	var eufilingfee_min = $("input[name=rates_eufilingfee_min]").val();
	if (eufilingfee_min){ eufilingfee = eufilingfee_min	};
	var eufilingfee_sum = parseFloat(eufilingfee)||0;
	var eufilingfee_sum2 = eufilingfee_sum.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_eufilingfee_amount','value':eufilingfee_sum2} );	
	$('input[name=\'rates_eufilingfee_amount\']').val(eufilingfee_sum2);
	});
	</script>
<script type="text/javascript">$(document).ready(function() {var docsreqd = $("input[name=rates_docsreqd]").val();
var rates_docsreqd = parseFloat(docsreqd)||0;
var rates_docsreqd2 = rates_docsreqd.toFixed(2);
$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_docsreqd_amount','value':rates_docsreqd2} );	
$('input[name=\'rates_docsreqd_amount\']').val(rates_docsreqd2);});

$("input[name=rates_docsreqd]").change(function(){
	var docsreqd = $("input[name=rates_docsreqd]").val();
	var rates_docsreqd = parseFloat(docsreqd)||0;
	var rates_docsreqd2 = rates_docsreqd.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_docsreqd_amount','value':rates_docsreqd2} );	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_docsreqd','value':rates_docsreqd2} );
	$('input[name=\'rates_docsreqd_amount\']').val(rates_docsreqd2); 
	$('input[name=\'rates_docsreqd\']').val(rates_docsreqd2); 
	});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_destdocs = $("input[name=rates_destdocs]").val();
var rates_destdocs = parseFloat(rates_destdocs)||0;
var rates_destdocs2 = rates_destdocs.toFixed(2);
$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_destdocs_amount','value':rates_destdocs2} );	
$('input[name=\'rates_destdocs_amount\']').val(rates_destdocs2);});

$("input[name=rates_destdocs]").change(function(){
	var rates_destdocs = $("input[name=rates_destdocs]").val();
	var rates_destdocs = parseFloat(rates_destdocs)||0;
	var rates_destdocs2 = rates_destdocs.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_destdocs','value':rates_destdocs2} );	
	$('input[name=\'rates_destdocs\']').val(rates_destdocs2); 
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_destdocs_amount','value':rates_destdocs2} );	
	$('input[name=\'rates_destdocs_amount\']').val(rates_destdocs2); 

	});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_customsclearance = $("input[name=rates_customsclearance]").val();
var rates_customsclearance = parseFloat(rates_customsclearance)||0;
$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_customsclearance_amount','value':rates_customsclearance.toFixed(2)} );	
$('input[name=\'rates_customsclearance_amount\']').val(rates_customsclearance.toFixed(2));});

$("input[name=rates_customsclearance]").change(function(){
	var rates_customsclearance = $("input[name=rates_customsclearance]").val();
	var rates_customsclearance2 = parseFloat(rates_customsclearance)||0;
	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_customsclearance','value':rates_customsclearance2.toFixed(2)} );	
	$('input[name=\'rates_customsclearance\']').val(rates_customsclearance2.toFixed(2)); 
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_customsclearance_amount','value':rates_customsclearance2.toFixed(2)} );	
	$('input[name=\'rates_customsclearance_amount\']').val(rates_customsclearance2.toFixed(2)); 

	});
</script>
<script type="text/javascript">$(document).ready(function() {var bolfee_min = $("input[name=rates_bolfee_min]").val();
	var bolfee_sum = parseFloat(bolfee_min)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_bolfee_amount','value':bolfee_sum.toFixed(2)});
	$('input[name=\'rates_bolfee_amount\']').val(bolfee_sum.toFixed(2));}
	);
	
	$("input[name=rates_bolfee_min]").change(function(){
			var bolfee_min = $("input[name=rates_bolfee_min]").val();
			var bolfee_sum = parseFloat(bolfee_min)||0;$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_bolfee_amount','value':bolfee_sum.toFixed(2)} );
			$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_bolfee_min','value':bolfee_sum.toFixed(2)} );$('input[name=\'rates_bolfee_min\']').val(bolfee_sum.toFixed(2));
			$('input[name=\'rates_bolfee_amount\']').val(bolfee_sum.toFixed(2));}
	);
</script>
<script type="text/javascript">$(document).ready(function() {var eufilingfee_min = $("input[name=rates_eufilingfee_min]").val();
	var eufilingfee_sum = parseFloat(eufilingfee_min)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_eufilingfee_amount','value':eufilingfee_sum.toFixed(2)});
	$('input[name=\'rates_eufilingfee_amount\']').val(eufilingfee_sum.toFixed(2));});
	
	$("input[name=rates_eufilingfee_min]").change(function(){
			var eufilingfee_min = $("input[name=rates_eufilingfee_min]").val();
			var eufilingfee_sum = parseFloat(eufilingfee_min)||0;
			$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_eufilingfee_amount','value':eufilingfee_sum.toFixed(2)} );
			$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_eufilingfee_min','value':eufilingfee_sum.toFixed(2)} );
			$('input[name=\'rates_eufilingfee_min\']').val(eufilingfee_sum.toFixed(2));
			$('input[name=\'rates_eufilingfee_amount\']').val(eufilingfee_sum.toFixed(2));});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_oncarriage = $("input[name=rates_oncarriage]").val();
	var rates_oncarriage = parseFloat(rates_oncarriage)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_oncarriage_amount','value':rates_oncarriage.toFixed(2)} );	
	$('input[name=\'rates_oncarriage_amount\']').val(rates_oncarriage.toFixed(2));});

	$("input[name=rates_oncarriage]").change(function(){
			var rates_oncarriage = $("#rates_oncarriage").val();
			var rates_oncarriage = parseFloat(rates_oncarriage)||0;
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_oncarriage', 'value':rates_oncarriage.toFixed(2)});
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_oncarriage_amount', 'value':rates_oncarriage.toFixed(2)});
			$('input[name=\'rates_oncarriage\']').val(rates_oncarriage.toFixed(2));
			$('input[name=\'rates_oncarriage_amount\']').val(rates_oncarriage.toFixed(2));	
	});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_baf = $("input[name=rates_baf]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};var baf_sum = commodity_wm * parseFloat(rates_baf)||0;
	var baf_sum = baf_sum.toFixed(2);$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_baf_amount','value':baf_sum});$('input[name=\'rates_baf_amount\']').val(baf_sum);});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_thc = $("input[name=rates_thc]").val();
	var rates_thc_min = $("input[name=rates_thc_min]").val();
	var rates_thc_min2 = parseFloat(rates_thc_min);
	var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(rates_thc)||0;
	if (ocean_sum<rates_thc_min2){ocean_sum = rates_thc_min2};
	var ocean_sum = ocean_sum.toFixed(2);	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_thc_amount','value':ocean_sum} );
	$('input[name=\'rates_thc_amount\']').val(ocean_sum);	
	});
	
$("input[name=rates_thc]").change(function(){
	var rates_thc =  $("input[name=rates_thc]").val();
	var rates_thc_min = $("input[name=rates_thc_min]").val();
	var rates_thc_min2 = parseFloat(rates_thc_min);	
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));	
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);	
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};	
	var ocean_sum = commodity_wm * parseFloat(rates_thc)||0;
	if (ocean_sum<rates_thc_min2){ocean_sum = rates_thc_min2};	
	var ocean_sum = ocean_sum.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_thc_amount','value':ocean_sum} );	
	$('input[name=\'rates_thc_amount\']').val(ocean_sum);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_thc', 'value':rates_thc});}
	);
    
    $("input[name=rates_thc_min]").change(function(){
	var rates_thc = $("#rates_thc").val();
	var rates_thc = parseFloat(rates_thc).toFixed(2);	
	var rates_thc_min = $("#rates_thc_min").val();
	var rates_thc_min2 = parseFloat(rates_thc_min);var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));	
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};var ocean_sum = commodity_wm * parseFloat(rates_thc)||0;
	if (ocean_sum<rates_thc_min2){ocean_sum = rates_thc_min2};	var ocean_sum = ocean_sum.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_thc_amount','value':ocean_sum} );
	$('input[name=\'rates_thc_amount\']').val(ocean_sum);	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_thc_min', 'value':rates_thc_min});
	});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_hazardous = $("input[name=rates_hazardous]").val();
	var rates_hazardous_min = $("input[name=rates_hazardous_min]").val();
	var rates_hazardous_min2 = parseFloat(rates_hazardous_min);
	var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(rates_hazardous)||0;
	if (ocean_sum<rates_hazardous_min2){ocean_sum =rates_hazardous_min2};
	var ocean_sum = ocean_sum.toFixed(2);	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_hazardous_amount','value':ocean_sum} );
	$('input[name=\'rates_hazardous_amount\']').val(ocean_sum);	});

	$("input[name=rates_hazardous]").change(function(){	
		var rates_hazardous = $("#rates_hazardous").val();	
		var rates_hazardous_min = $("input[name=rates_hazardous_min]").val();	
		var rates_hazardous_min2 = parseFloat(rates_hazardous_min);		
		
		var regexp=/\D/g;
		var commodity_cbm = $("input[name='commodity_cbm']").val();
		var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));	
		var commodity_kg = $("input[name='commodity_kg']").val();
		var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));	
		var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);	
		var commodity_wm = commodity_cbm3;
		if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};	
		var ocean_sum = commodity_wm * parseFloat(rates_hazardous)||0;
		if (ocean_sum<rates_hazardous_min2){ocean_sum = rates_hazardous_min2};	
		var ocean_sum = ocean_sum;
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_hazardous', 'value':rates_hazardous});	
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_hazardous_min', 'value':rates_hazardous_min2});
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_hazardous_amount','value':ocean_sum.toFixed(2)} );		
		
		$('input[name=\'rates_hazardous\']').val(rates_hazardous);
		$('input[name=\'rates_hazardous_min\']').val(rates_hazardous_min2);
		$('input[name=\'rates_hazardous_amount\']').val(ocean_sum.toFixed(2));	
	
	});
	
	$("input[name=rates_hazardous_min]").change(function(){	
		var rates_hazardous = $("#rates_hazardous").val();	
		var rates_hazardous_min = $("input[name=rates_hazardous_min]").val();	
		var rates_hazardous_min2 = parseFloat(rates_hazardous_min);		
		var regexp=/\D/g;
		var commodity_cbm = $("input[name='commodity_cbm']").val();
		var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
		var commodity_kg = $("input[name='commodity_kg']").val();	
		var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));	
		var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
		var commodity_wm = commodity_cbm3;
		if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
		var ocean_sum = commodity_wm * parseFloat(rates_thc)||0;
		if (ocean_sum<rates_thc_min2){ocean_sum = rates_thc_min2};	
		var ocean_sum = ocean_sum.toFixed(2);
		
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_hazardous_amount','value':ocean_sum} );
		$('input[name=\'rates_hazardous_amount\']').val(ocean_sum);	
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_hazardous_min', 'value':rates_hazardous_min2});
		});	
</script>
<script type="text/javascript">$(document).ready(function() {var rates_brokerage_percentage = $("input[name=rates_brokerage_percentage]").val();
	var ocean_freight = $("input[name=rates_oceanfreight_amount]").val();
	var rates_brokerage_total = (parseFloat(rates_brokerage_percentage)*parseFloat(ocean_freight)/100);	
	$('input[name=\'rates_brokerage_percentage_amount\']').val(rates_brokerage_total.toFixed(2));
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_amount', 'value':rates_brokerage_total});
	});

	$("input[name=rates_brokerage_percentage]").change(function(){
	var ocean_freight = $("input[name=rates_oceanfreight_amount]").val();
	var rates_brokerage_percentage = $("input[name=rates_brokerage_percentage]").val();
	var rates_brokerage_percentage2 = parseFloat(rates_brokerage_percentage);
	var rates_brokerage_total = (parseFloat(rates_brokerage_percentage2)*(parseFloat(ocean_freight)/100));	
	$('input[name=\'rates_brokerage_percentage_amount\']').val(rates_brokerage_total.toFixed(2));
	$('input[name=\'rates_brokerage_percentage\']').val(rates_brokerage_percentage);
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage', 'value':rates_brokerage_percentage});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_min', 'value':rates_brokerage_percentage});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_amount', 'value':rates_brokerage_total});

	});

</script>
<script type="text/javascript">$(document).ready(function() {var rates_precarriage = $("input[name=rates_precarriage]").val();
	var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();
	var rates_precarriage_min2 = parseFloat(rates_precarriage_min);	
		
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_precarriage_amount','value':rates_precarriage_min2} );
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_min2);
	});
		
	$("input[name=rates_precarriage]").change(function(){	
		var rates_precarriage = $("#rates_precarriage").val();
		var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();
	});
	
	$("input[name=rates_precarriage_min]").change(function(){
		var rates_precarriage = $("#rates_precarriage").val();
		var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();
		var rates_precarriage_min2 = parseFloat(rates_precarriage_min);
		});
	
</script>
<script type="text/javascript">$(document).ready(function() {var rates_chassissurcharge = $("input[name=rates_chassissurcharge]").val();
	var rates_chassissurcharge_min = $("input[name=rates_chassissurcharge_min]").val();
	var rates_chassissurcharge_min2 = parseFloat(rates_chassissurcharge_min);
	var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(rates_chassissurcharge)||0;
	if (ocean_sum<rates_chassissurcharge_min2){ocean_sum = rates_chassissurcharge_min2};
	var ocean_sum = ocean_sum.toFixed(2);	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_chassissurcharge_amount','value':ocean_sum} );
	$('input[name=\'rates_chassissurcharge_amount\']').val(ocean_sum);	});
		
	$("input[name=rates_chassissurcharge]").change(function(){
		var rates_chassissurcharge = $("#rates_chassissurcharge").val();	
		var rates_chassissurcharge_min = $("input[name=rates_chassissurcharge_min]").val();	
		var rates_chassissurcharge_min2 = parseFloat(rates_chassissurcharge_min);		
		var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();	
		var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));	
		var commodity_kg = $("input[name='commodity_kg']").val();	
		var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));	
		var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);		
		var commodity_wm = commodity_cbm3;
		if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};		
		var ocean_sum = commodity_wm * parseFloat(rates_chassissurcharge)||0;
		if (ocean_sum<rates_chassissurcharge_min2){ocean_sum = rates_chassissurcharge_min2};	
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_chassissurcharge', 'value':rates_chassissurcharge});	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_chassissurcharge_amount','value':ocean_sum} );		
		$('input[name=\'rates_chassissurcharge_amount\']').val(ocean_sum);	
		$('input[name=\'rates_chassissurcharge_min\']').val(rates_chassissurcharge);	
		$('input[name=\'rates_chassissurcharge\']').val(rates_chassissurcharge);
		});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_line_haul = $("input[name=rates_line_haul]").val();
	var rates_line_haul_min = $("input[name=rates_line_haul_min]").val();
	var rates_line_haul_min2 = parseFloat(rates_line_haul_min);
	var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(rates_line_haul)||0;
	if (ocean_sum<rates_line_haul_min2){ocean_sum = rates_line_haul_min2};
	var ocean_sum = ocean_sum.toFixed(2);	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_line_haul_amount','value':ocean_sum} );
	$('input[name=\'rates_line_haul_amount\']').val(ocean_sum);	
	});

    $("input[name=rates_line_haul]").change(function(){
	var rates_line_haul =  $("input[name=rates_line_haul]").val();
	var rates_line_haul_min = $("input[name=rates_line_haul_min]").val();
	var rates_line_haul_min2 = parseFloat(rates_line_haul_min);	
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));	
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);	
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};	
	var ocean_sum = commodity_wm * parseFloat(rates_line_haul)||0;
	if (ocean_sum<rates_line_haul_min2){ocean_sum =rates_line_haul_min2};	
	var ocean_sum = ocean_sum.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_line_haul_amount','value':ocean_sum} );	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_line_haul', 'value':rates_line_haul});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_line_haul_min', 'value':rates_line_haul_min2.toFixed(2)});
	$('input[name=\'rates_line_haul_amount\']').val(ocean_sum);
	
	});

	$("input[name=rates_line_haul_min]").change(function(){
	var rates_line_haul =  $("input[name=rates_line_haul]").val();
	var rates_line_haul_min = $("input[name=rates_line_haul_min]").val();
	var rates_line_haul_min2 = parseFloat(rates_line_haul_min);	
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));	
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);	
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};	
	var ocean_sum = commodity_wm * parseFloat(rates_line_haul)||0;
	if (ocean_sum<rates_line_haul_min2){ocean_sum =rates_line_haul_min2};	
	var ocean_sum = ocean_sum.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_line_haul_amount','value':ocean_sum} );	
	$('input[name=\'rates_line_haul_amount\']').val(ocean_sum);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_line_haul', 'value':rates_line_haul});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_line_haul_min', 'value':rates_line_haul_min2.toFixed(2)});
	});
	
</script>	
<script type="text/javascript">$(document).ready(function() {var rates_other2 = $("input[name=rates_other2]").val();
	var rates_other2_sum = parseFloat(rates_other2)||0;	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other2_amount','value':rates_other2_sum.toFixed(2)});
	$('input[name=\'rates_other2_amount\']').val(rates_other2_sum.toFixed(2));});	
	
	$("input[name=rates_other2]").change(function(){
		var rates_other2 = $("input[name=rates_other2]").val();	
		var rates_other2_sum = parseFloat(rates_other2)||0;	
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other2_amount','value':rates_other2_sum.toFixed(2)
			} 	);
	$('input[name=\'rates_other2_amount\']').val(rates_other2_sum.toFixed(2));
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_other2', 'value':rates_other2});
	});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_other3 = $("input[name=rates_other3]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var rates_other3_sum = commodity_wm * parseFloat(rates_other3)||0;
	if (rates_other3_sum<rates_other3){rates_other3_sum = parseFloat(rates_other3)||0};	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other3_amount','value':rates_other3_sum.toFixed(2)} 	);
	$('input[name=\'rates_other3_amount\']').val(rates_other3_sum.toFixed(2));	});	
	
$("input[name=rates_other3]").change(function(){
	var rates_other3 = $("#rates_other3").val();
	var rates_other3 = parseFloat(rates_other3).toFixed(2);
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var rates_other3_sum = commodity_wm * parseFloat(rates_other3)||0;
	if (rates_other3_sum<rates_other3){rates_other3_sum = parseFloat(rates_other3)||0};	
	var rates_other3_sum = rates_other3_sum.toFixed(2);	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other3_amount','value':rates_other3_sum} );
	$('input[name=\'rates_other3_amount\']').val(rates_other3_sum);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_other3', 'value':rates_other3});
	});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_other4 = $("input[name=rates_other4]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var rates_other4_sum = commodity_wm * parseFloat(rates_other4)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other4_amount','value':rates_other4_sum.toFixed(2)});
	$('input[name=\'rates_other4_amount\']').val(rates_other4_sum.toFixed(2));	}
	);

$("input[name=rates_other4]").change(function(){
	var rates_other4 = $("#rates_other4").val();
	var rates_other4 = parseFloat(rates_other4).toFixed(2);
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var rates_other4_sum = commodity_wm * parseFloat(rates_other4)||0;
	var rates_other4_sum = rates_other4_sum.toFixed(2);	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other4_amount','value':rates_other4_sum} );	
	$('input[name=\'rates_other4_amount\']').val(rates_other4_sum);	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_other4', 'value':rates_other4});
	}	);
	
</script>
<script type="text/javascript">$(document).ready(function() {var rates_wgtsurcharge = $("input[name=rates_wgtsurcharge]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var rates_wgtsurcharge_sum = commodity_wm * parseFloat(rates_wgtsurcharge)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_wgtsurcharge_amount','value':rates_wgtsurcharge_sum.toFixed(2)});
	$('input[name=\'rates_wgtsurcharge_amount\']').val(rates_wgtsurcharge_sum.toFixed(2));	}
	);

$("input[name=rates_wgtsurcharge]").change(function(){
	var rates_wgtsurcharge = $("input[name='rates_wgtsurcharge']").val();
	var commodity_cbm = $("input[name='commodity_cbm']").val();	
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var rates_wgtsurcharge_amount = (commodity_cbm3 * parseFloat(rates_wgtsurcharge));

	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_wgtsurcharge', 'value':parseFloat(rates_wgtsurcharge).toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_wgtsurcharge_amount', 'value':rates_wgtsurcharge_amount});
	$('input[name=\'rates_wgtsurcharge\']').val(parseFloat(rates_wgtsurcharge).toFixed(2));
	$('input[name=\'rates_wgtsurcharge_amount\']').val(rates_wgtsurcharge_amount.toFixed(2));
	});
	
</script>
<script type="text/javascript">$("input[name=rates_forwarderadvance]").change(function(){
	var rates_forwarderadvance = $("#rates_forwarderadvance").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_forwarderadvance', 'value':rates_forwarderadvance});
	}
	);</script>
<script type="text/javascript">$("input[name=rates_aesfilingbytcl]").live('change',function(){
	var rates_aesfilingbytcl = $("#rates_aesfilingbytcl").val();
	var rates_aesfilingbytcl = parseFloat(rates_aesfilingbytcl).toFixed(2);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_aesfilingbytcl', 'value':rates_aesfilingbytcl});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_aesfilingbytcl_amount', 'value':rates_aesfilingbytcl});	
	$('input[name=\'rates_aesfilingbytcl\']').val(rates_aesfilingbytcl);$('input[name=\'rates_aesfilingbytcl_amount\']').val(rates_aesfilingbytcl);
	});</script>


<script type="text/javascript">$("input[name=truckingdays]").live('change',function(){	
	var truckingdays = $("#truckingdays").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckingdays','value':truckingdays} );
	$('input[name=\'truckingdays\']').val(truckingdays);	
	
	});	
</script>
<script type="text/javascript">$("input[name=truckingrate_min_profit]").live('change',function(){
	
	var truckingrate_min_profit =$("input[name=truckingrate_min_profit]").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_min_profit', 'value':truckingrate_min_profit});

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
<script type="text/javascript">$("input[name=truckingrate_markup]").live('change',function(){
	
	var truckingrate_markup =$("input[name=truckingrate_markup]").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_markup', 'value':truckingrate_markup});
	
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
	
	
	});
</script>
<script type="text/javascript">$("input[name=truckingrate_max_profit]").change(function(){
	
	var truckingrate_max_profit =$("input[name=truckingrate_max_profit]").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_max_profit', 'value':truckingrate_max_profit});

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
<script type="text/javascript">$("input[name=truckingrate_per_effect]").change(function(){	
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
<script type="text/javascript"><!---//Haz Classes --->
	$("input[name=hazclass1]").change(function(){
	var hazclass1 = $("#hazclass1").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass1','value':hazclass1});
	$('input[name=\'hazclass1\']').val(hazclass1);});
	
	$("input[name=hazclass2]").change(function(){
		var hazclass2 = $("#hazclass2").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass2','value':hazclass2} );	
	$('input[name=\'hazclass2\']').val(hazclass2);});
	
	$("input[name=hazclass3]").change(function(){
		var hazclass3 = $("#hazclass3").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass3','value':hazclass3} );
	$('input[name=\'hazclass3\']').val(hazclass3);});	
	
	$("input[name=un]").change(function(){
		var un = $("#un").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'un','value':un} );
	$('input[name=\'un\']').val(un);});	
	
</script>
<script type="text/javascript">$("input[name=commodity_hazardous_approval]").change(function(){
	var commodity_hazardous_approval = $("#commodity_hazardous_approval").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'commodity_hazardous_approval','value':commodity_hazardous_approval} );
	$('input[name=\'commodity_hazardous_approval\']').val(commodity_hazardous_approval);	
	
	});	</script>		
<script type="text/javascript">$("input[name=entry_other2]").change(function(){
	var entry_other2 =$("#entry_other2").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'entry_other2', 'value':entry_other2});
	});
</script>	
<script type="text/javascript">$("input[name=entry_other4]").change(function(){
	var entry_other4 =$("#entry_other4").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'entry_other4', 'value':entry_other4});
	});
</script>
<script type="text/javascript">$("textarea[name=notes_ops_add]").change(function(){
	
	var notes_ops_add =$("#notes_ops_add").val();
	var notes_ops_list= new Array();
	
	notes_ops_list[0]=encodeURI(notes_ops_add);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'notes_ops_add', 'value':notes_ops_add});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'notes_ops_list', 'value':notes_ops_list});
	
	});
	</script>		
<script type="text/javascript">$(document).ready(function() {
	calculateSum();
	
	$(".txt").change("keydown keyup", function() {calculateSum();	});  
	
	function calculateSum() {
		var sum = 0; 
		$(".txt").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				sum += parseFloat(this.value); 
				$(this).css("background-color", "#FEFFB0"); } 
			else if (this.value.length != 0){
				$(this).css("background-color", "red"); }});
		
			$("#sum").html(sum.toFixed(2));
			$("#sum2").html(sum.toFixed(2));	
			
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total', 'value':(sum.toFixed(2))});
			$('input[name=\'sum2\']').val(sum.toFixed(2));
	}
	
	}); 
</script>
<script type="text/javascript">$(document).ready(function() {calculateSumDebit();
	
	$(".txtDebit").change("keydown keyup", function() {
	calculateSumDebit();});}); 
	function calculateSumDebit() {
		var sumDebit = 0; 
		$(".txtDebit").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				sumDebit += parseFloat(this.value); 
				$(this).css("background-color", "#FEFFB0"); } 
			else if (this.value.length != 0){
				$(this).css("background-color", "red"); }});
			$("#sumDebit").html(sumDebit.toFixed(2));
			$("#sumDebit2").html(sumDebit.toFixed(2));	
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total_debit', 'value':(sumDebit.toFixed(2))})
			;}
</script>
<script type="text/javascript">$(document).ready(function() {calculateSumCredit_quote();
$(".txtCredit_quote").change("keydown keyup", function() {
	calculateSumCredit_quote();});}); 
	function calculateSumCredit_quote() {
		var sumCredit_quote = 0; 
		$(".txtCredit_quote").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				sumCredit_quote += parseFloat(this.value); 
				$(this).css("background-color", "#FEFFB0"); } 
			else if (this.value.length != 0){
				$(this).css("background-color", "red"); }});
			$("#sumCredit_quote").html(sumCredit_quote.toFixed(2));
			$("#sumCredit_quote2").html(sumCredit_quote.toFixed(2));	
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total_credit_quote', 'value':(sumCredit_quote.toFixed(2))})
			;}
</script>
<script type="text/javascript">$(document).ready(function() {calculateSumCredit_booking();
$(".txtCredit_booking").change("keydown keyup", function() {
	calculateSumCredit_booking();});}); 
	function calculateSumCredit_booking() {
		var sumCredit_booking = 0; 
		$(".txtCredit_booking").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {
				sumCredit_booking += parseFloat(this.value); 
				$(this).css("background-color", "#FEFFB0"); } 
			else if (this.value.length != 0){
				$(this).css("background-color", "red"); }});
			$("#sumCredit_booking").html(sumCredit_booking.toFixed(2));
			$("#sumCredit_booking2").html(sumCredit_booking.toFixed(2));	
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total_credit_booking', 'value':(sumCredit_booking.toFixed(2))})
			;}
</script>
<script type="text/javascript"><!--- Checkboxes --->

	$("input[name='Bkcold']").change(function(){	
		var Bkcold =$("#Bkcold:checked").val();
		var personaleffects = 'false';
		if (document.getElementById("personaleffects").checked){var Bkcold ='S';
		var personaleffects = 'true';		}	
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'personaleffects', 'value':personaleffects});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'Bkcold', 'value':Bkcold});});
	
	$("input[name=pickup]").change(function(){
		var pickup =$("#pickup").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickup', 'value':pickup})	;
		$('input[name=\'pickup\']').val(pickup);
	});
	
	$("input[name=destination_service]").change(function(){
		var destination_service =$("#destination_service").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'destination_service', 'value':destination_service})	;
		$('input[name=\'destination_service\']').val(destination_service);
	});
	
	$("input[name=destdocs]").change(function(){
		var destdocs =$("#destdocs").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'destdocs', 'value':destdocs})	;
		$('input[name=\'destdocs\']').val(destdocs);
	});
	
	$("input[name=customs]").change(function(){
		var customs =$("#customs").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customs', 'value':customs})	;
		$('input[name=\'customs\']').val(customs);
	});
	$("input[name=thc]").change(function(){
		var thc =$("#thc").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'thc', 'value':thc})	;
		$('input[name=\'thc\']').val(thc);
	});

	$("input[name=doormove]").change(function(){
		var doormove =$("#doormove").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'doormove', 'value':doormove});}	
		);
	
	$("input[name=bkbtob]").change(function(){
		var bkbtob =$("#bkbtob").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'bkbtob', 'value':bkbtob});}	
		);	

	$("input[name=hazardous]").change(function(){
		var hazardous =$("#hazardous").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'hazardous', 'value':hazardous});}	
		);
	
	
	
</script>

<script type="text/javascript">$("input[name=routedcargo]").change(function(){
	var routedcargo =$("#routedcargo").is(':checked') ? true : false;
	var customerName = $("#customerName").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'routedcargo', 'value':routedcargo})	;
	$('input[name=\'routedcargo\']').val(routedcargo);
	
	if (!routedcargo){
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'nonRoutedCargo', 'value':true})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerSignator', 'value':null})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerConsignee', 'value':null})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerNotify', 'value':null})	;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail', 'value':customerName});
		
		
		} else {
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'nonRoutedCargo', 'value':false})	;
		}
	
	});
</script>
<script type="text/javascript">$("input[name=customerSignator]").change(function(){
	var customerName = $("#customerName").val();
	var customerSignator = $("#customerSignator").val();
	var customerConsignee = $("#customerConsignee").val();
	var customerNotify = $("#customerNotify").val();
	var cr = '\n';
	var customerdetail = customerName+cr+'S/'+customerSignator+cr+'C/'+customerConsignee+cr+'N/'+customerNotify+cr;

	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail', 'value':customerdetail});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerSignator', 'value':customerSignator});
	});</script>
<script type="text/javascript">$("input[name=customerConsignee]").change(function(){
	var customerName = $("#customerName").val();
	var customerSignator = $("#customerSignator").val();
	var customerConsignee = $("#customerConsignee").val();
	var customerNotify = $("#customerNotify").val();
	var cr = '\n';
	var customerdetail = customerName+cr+'S/'+customerSignator+cr+'C/'+customerConsignee+cr+'N/'+customerNotify+cr;

	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail', 'value':customerdetail});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerConsignee', 'value':customerConsignee});}
	);</script>
<script type="text/javascript">$("input[name=customerNotify]").change(function(){
	var customerName = $("#customerName").val();
	var customerSignator = $("#customerSignator").val();
	var customerConsignee = $("#customerConsignee").val();
	var customerNotify = $("#customerNotify").val();
	var cr = '\n';
	var customerdetail = customerName+cr+'S/'+customerSignator+cr+'C/'+customerConsignee+cr+'N/'+customerNotify+cr;

	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail', 'value':customerdetail});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerNotify', 'value':customerNotify});}
	);</script>
	<script type="text/javascript">$("input[name='idd']").change(function(){var idd = $("#idd").val();	
	$('input[name=\'idd\']').val(idd);	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'idd', 'value':idd});	
	
	});

</script>
<script type="text/javascript">$("input[name='idd']").change(function(){var idd = $("#idd").val();	
	$('input[name=\'idd\']').val(idd);	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'idd', 'value':idd});	
	
	});

</script>
<script type="text/javascript">var form = document.getElementById("formId");
	var elements = form.elements;
	for (var i = 0, len = elements.length; i < len; ++i) {
	    elements[i].readOnly = true;
	}

	var inputs = document.getElementsByTagName('input');

	for(var i = 0; i < inputs.length; i++){
	  if(inputs[i].type == 'submit'){
	    inputs[i].disabled = 'disabled';
	  }
	}

	$('input[type="button"]').attr("disabled","disabled");
	
</script>

</div>

<?php echo $footer; ?>