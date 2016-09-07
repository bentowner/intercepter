<?php echo $header; ?><?php echo $column_right; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
       <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
       <a type="button" id="button-quotes-view" data-toggle="tooltip" href="<?php echo $quotesearch; ?>" title="<?php echo $button_quotes_view; ?>" class="btn btn-info"><i class="fa fa-flag-o"></i></a>
       <a type="button" id="button-quotes-web-view"  data-toggle="tooltip"  href="<?php echo $webquotesearch; ?>" title="<?php echo $button_quotes_web_view; ?>" class="btn btn-info"><i class="fa fa-external-link"></i></a>
 <?php if ($filter_webquotes !='true') { ?>      
       <a type="button" id="button-refresh" data-toggle="tooltip"  href="<?php echo $updateDraft; ?>" title="<?php echo $button_draft; ?>" class="btn btn-warning"><i class="fa fa-refresh"></i></a>
 <?php } ?>
 <?php if ($quotenumber) { ?>
	 <?php if ($filter_webquotes !='true') { ?>
	       <a type="button" id="button-print" form="form-quote" href="<?php echo $print; ?>" data-toggle="tooltip" title="<?php echo $button_quote_print; ?>"  TARGET="_blank" class="btn btn-info"><i class="fa fa-print"></i></a>
	 <?php } ?> 
 <?php } ?>

      <a type="submit" id="button-trucking" form="form-quote" href="<?php echo $trucking; ?>" data-toggle="tooltip" title="<?php echo $button_trucking; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a>
       <a type="button" id="button-quotes-view"  data-toggle="tooltip" href="<?php echo $add_booking; ?>" title="<?php echo $button_add_booking; ?>" class="btn btn-info"><i class="fa fa-flag"></i></a>
 <?php if ($filter_webquotes !='true') { ?>
        <a type="button" id="button-save" href="<?php echo $save; ?>"  class="btn btn-primary"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></a>
 <?php } ?>
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
	      <?php if ($quote_no) { ?><?php echo $quote_no;?> |<?php } ?>
	      <?php if ($quotedate) { ?><?php echo $entry_quotedate; ?> <?php echo $quotedate; ?>  |<?php } else { ?><input type="hidden"  name="quotedate" value="<?php echo date("m-d-Y"); ?>"/><?php } ?>
	      <?php if ($quoteby) { ?><?php echo $entry_quoteby; ?> <?php echo $quoteby;?>  |<?php } ?>
	      <?php if ($qtstatus) { ?><?php echo $entry_status; ?> <?php echo $qtstatus; ?>  |<?php } ?> 
	  </h3>
	  </div>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading" style="background:purple;">
        <h3 class="panel-title"  style="color:yellow;"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>  
       <div class="panel-body">
       
        <div class="form-group">
        
      	 <div class="row">
      	  <div class=".col-lg-4 col-md-4 col-sm-6"><?php echo $customer_data; ?></div>
	      <div class=".col-lg-5 col-md-5 col-sm-6"><?php echo $service_details; ?></div>
	      <div class=".col-lg-3 col-md-3 col-sm-6"><?php echo $commodity_details; ?></div>
	     </div>
	    
	    <div class="row" >
	    	 <div class=".col-lg-2 col-md-2 col-sm-2" >	
	    		 <i class="fa fa-flag"></i> Quote Types:<br>
	    		 <table class="bordered" >
			 <tr>
			 
              	<td></td>
             </tr><tr>
 		      
         <?php if ($Bkcold=='C'  && $personaleffects == 'false') { ?>
   <td style="padding-left: 1cm;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();">
   					 <input type="radio" id="coload" name="Bkcold" value="C" checked="checked"> <?php echo $entry_coload; ?></td>
  </tr><tr>
   <td style="padding-left: 1cm ;text-align: left"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></td>
  </tr><tr>   
   <td style="padding-left: 1cm ;text-align: left"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" > <?php echo $entry_shipper; ?></label></td>
  </tr><tr>    
   <td style="padding-left: 1cm ;text-align: left"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="false" > <?php echo $entry_personaleffects; ?></label></td>
        <?php } elseif ($Bkcold=='F'){ ?>
    <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();">
					<input type="radio" id="coload" name="Bkcold" value="C"> <?php echo $entry_coload; ?></label></td>
   </tr><tr>	    
  <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" checked="checked"> <?php echo $entry_forward; ?></label></td>
   </tr><tr>    
   <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" > <?php echo $entry_shipper; ?></label></td>
    </tr><tr>    
   <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="false" > <?php echo $entry_personaleffects; ?></label></td>
                
        <?php } elseif ($Bkcold=='S' && $personaleffects == 'false'){ ?>
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();">
            	    <input type="radio" id="coload" name="Bkcold" value="C"><?php echo $entry_coload; ?></label></td>
            </tr><tr>	    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></label></td>
            </tr><tr>    
               <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" checked="checked"> <?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="false" > <?php echo $entry_personaleffects; ?></label></td>
     
        	              
	<?php } elseif ($personaleffects == 'true') { ?>   
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();">
            	    <input type="radio" id="coload" name="Bkcold" value="C"><?php echo $entry_coload; ?></label></td>
            </tr><tr>	    
               <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></label></td>
            </tr><tr>    
               <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="S" > <?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> <input type="radio" id="personaleffects" name="Bkcold" value="true" checked="checked"> <?php echo $entry_personaleffects; ?></label></td>
              
   <?php } else { ?>
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onchange="showHide();nodisplayBrokerage();"> 
                	<input type="radio" id="coload" name="Bkcold" value="C" > <?php echo $entry_coload; ?></label></td>
            </tr><tr>    
                <td style="padding-left: 1cm ;text-align: left;"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'"  onchange="showHide();displayBrokerage();"> <input type="radio" id="Bkcold" name="Bkcold" value="F" > <?php echo $entry_forward; ?></label></td>
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
   <?php if ($service_portofdest_charge == 'true') { ?>	
				<input type="checkbox" name = "service_portofdest_charge" id= "service_portofdest_charge" checked="checked"> Show Destination Charges
			<?php }else { ?>	
				<input type="checkbox" name = "service_portofdest_charge" id= "service_portofdest_charge" > Show Destination Charges
			<?php } ?>
			  </label>
			  </td>
			  
	        </tr>
	        <tr><td><label>
	        <?php if ($personaleffects == 'true') { ?>
				<input type="checkbox" name = "" > Show PE /Cft
				<?php } ?>
				 </label>
			  </td>
			  
	        </tr>
	        <tr >
	        <td><label> 
	
	        <input type="checkbox"  onchange="showHide();" id="destination_service"  name="destination_service" id="destination_service"  > Other Destination Service
         	</tr>
         	<tr id="destination_service_group" name="destination_service_group" style="display:none;"> 
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
              
             
      <?php if ($hazardous  == "true") { ?>	
	         <tr> 
			  <td><label>
			  <input type="checkbox" id = "hazardous" name="hazardous" value="" checked="checked"  onchange="showHide();"> <?php echo $entry_hazardous; ?>
              </label></td>
             </tr>
              
	      
      <?php } else { ?>
              <tr> 
			  <td><label>
              <input type="checkbox"  id = "hazardous" name="hazardous" value=""  onchange="showHide();"> <?php echo $entry_hazardous; ?>
               </label></td>
             </tr>	  
            
     <?php } ?>     
         
     </table>
	    	 	
	    	 
	    	 </div>	    	 
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
	</div>
     	
     	
	     
	</div>     
        <form class="form-horizontal">
          <ul id="quote_info" class="nav nav-tabs nav-justified">
            <li class=""><a href="#tab-rates" data-toggle="tab"><?php echo $tab_rates; ?></a></li>
   			<li class="" id="trucking_tab" ><a href="#tab-trucking" data-toggle="tab"><?php echo $tab_trucking; ?></a></li>
            <li class=""><a href="#tab-costs" data-toggle="tab"><?php echo $tab_costs; ?></a></li>
   			<li class=""><a href="#tab_approvals" data-toggle="tab"><?php echo $tab_approvals; ?></a></li>
            <li class=""><a href="#tab_notes" data-toggle="tab"><?php echo $tab_notes; ?></a></li>
            <li class=""><a href="#tab-tracking_log" data-toggle="tab"><?php echo $tab_tracking_log; ?></a></li>
          </ul>
   <div class="tab-content">
	<div class="tab-pane" id="tab-rates">
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
			 <tr  id="rates_oceanfreight_group" name="rates_oceanfreight_group" style="display:none" >
              <td><?php echo $entry_rates_oceanfreight; ?></td>
              <td><input type="text" placeholder="$0.00" id ="rates_oceanfreight" name="rates_oceanfreight" value="<?php echo $rates_oceanfreight; ?>"  class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id ="rates_oceanfreight_min" name="rates_oceanfreight_min" value="<?php echo $rates_oceanfreight_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly"   class="txt form-control" type="text" placeholder="$0.00" id="rates_oceanfreight_amount" name="rates_oceanfreight_amount" value="<?php echo $rates_oceanfreight_amount; ?>" /></td>
            
            </tr>
			
            <tr  id="rates_thc_group" name="rates_thc_group" style="display:none" >
              <td><?php echo $entry_rates_thc; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_thc"  name="rates_thc" value="<?php echo $rates_thc; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_thc_min" name="rates_thc_min" value="<?php echo $rates_thc_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly"  class="txt form-control" type="text" placeholder="$0.00" name="rates_thc_amount" value="<?php echo $rates_thc; ?>" /></td>
            </tr>    
            
             
            
            <tr  id="rates_baf_group" name="rates_baf_group" style="display:none" >
              <td><?php echo $entry_rates_baf; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_baf" name="rates_baf" value="<?php echo $rates_baf; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_baf_min" name="rates_baf_min" value="<?php echo $rates_baf_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_baf_amount" name="rates_baf_amount" value="<?php echo $rates_baf_amount; ?>" /></td>
            </tr>
            
            
            
            <tr  id="rates_chassissurcharge_group" name="rates_chassissurcharge_group" style="display:none" >
              <td><?php echo $entry_rates_chassissurcharge; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_chassissurcharge" name="rates_chassissurcharge" value="<?php echo $rates_chassissurcharge; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" name="rates_chassissurcharge_min" value="<?php echo $rates_chassissurcharge_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" name="rates_chassissurcharge_amount" value="<?php echo $rates_chassissurcharge_amount; ?>"  /></td>
            </tr> 
          
            
           
            <tr  id="rates_hazardous_group" name="rates_hazardous_group" style="display:none" >
              <td><?php echo $entry_rates_hazsurcharge; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_hazardous" name="rates_hazardous" value="<?php echo $rates_hazardous; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_hazardous_min"  name="rates_hazardous_min" value="<?php echo $rates_hazardous_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_hazardous_amount" name="rates_hazardous_amount" value="<?php echo $rates_hazardous_amount; ?>" /></td>
            </tr>
          
            
            
            <tr  id="rates_precarriage_group" name="rates_precarriage_group" style="display:none" >
              <td><?php echo $entry_rates_precarriage; ?></td>
              <td><input type="text" placeholder="$0.00" id ="rates_precarriage" name="rates_precarriage" value="<?php echo $rates_precarriage; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00" name="rates_precarriage_min" value="<?php echo $rates_precarriage_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00"  name="rates_precarriage_amount"  value="<?php echo $rates_precarriage_amount; ?>"/></td>
            </tr>
           
            
            
            <tr  id="rates_fuelsurcharge_group" name="rates_fuelsurcharge_group" style="display:none" >
              <td><?php echo $entry_rates_fuelsurcharge; ?></td>
              <td><input type="text" placeholder="0" id="rates_fuelsurcharge" name="rates_fuelsurcharge" value="<?php echo $rates_fuelsurcharge; ?>" class="form-control" /></td>
              <td>%</td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" name="rates_fuelsurcharge_amount" value="<?php echo $rates_fuelsurcharge_amount; ?>"  /></td>
            </tr>
            
            
             
            <tr  id="rates_forwarderadvance_group" name="rates_forwarderadvance_group" style="display:none" >
              <td><?php echo $entry_rates_forwarderadvance; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" onchange="self.location=self.location" id="rates_forwarderadvance" name="rates_forwarderadvance" value="<?php echo $rates_forwarderadvance; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text"  placeholder="$0.00" name="rates_forwarderadvance_amount" value="<?php echo $rates_forwarderadvance; ?>" /></td>
            </tr> 
           
            <tr  id="rates_bolfee_min_group" name="rates_bolfee_min_group" style="display:none" >
              <td><?php echo $entry_rates_bolfee; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_bolfee_min" name="rates_bolfee_min" value="<?php echo $rates_bolfee_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" name="rates_bolfee_amount" value="<?php echo $rates_bolfee_amount; ?>" /></td>
            </tr>
           
            <tr  id="rates_eufilingfee_min_group" name="rates_eufilingfee_min_group" style="display:none" >
              <td><?php echo $entry_rates_eufilingfee; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_eufilingfee_min" name="rates_eufilingfee_min" value="<?php echo $rates_eufilingfee_min; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" name="rates_eufilingfee_amount" value="<?php echo $rates_eufilingfee; ?>"  /></td>
            </tr>
          
           
            <tr  id="rates_customsclearance_group" name="rates_customsclearance_group" style="display:none" >
              <td><?php echo $entry_rates_customsclearance; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_customsclearance" id="rates_customsclearance" value="<?php echo $rates_customsclearance; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_customsclearance_amount" name="rates_customsclearance_amount" value="<?php echo $rates_customsclearance_amount; ?>"  /></td>
            </tr> 
           
            <tr  id="rates_oncarriage_group" name="rates_oncarriage_group" style="display:none" >
              <td><?php echo $entry_rates_oncarriage; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_oncarriage" id="rates_oncarriage" value="<?php echo $rates_oncarriage; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_oncarriage_amount" name="rates_oncarriage_amount" value="<?php echo $rates_oncarriage_amount; ?>" /></td>
            </tr>
             
             
   			
            <tr id="destdocs_group" name="destdocs_group" style="display:none" >
              <td><?php echo $entry_rates_destdocs; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00"  id="rates_destdocs" name="rates_destdocs" value="<?php echo $rates_destdocs; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" name="rates_destdocs_amount"  id="rates_destdocs_amount" value="<?php echo $rates_destdocs_amount; ?>" /></td>
            </tr>
            
            
            
            <tr  id="rates_aesfilingbytcl_group" name="rates_aesfilingbytcl_group" style="display:none" >
              <td><?php echo $entry_rates_aesfilingbytcl; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_aesfilingbytcl" name="rates_aesfilingbytcl" value="<?php echo $rates_aesfilingbytcl; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00"id="rates_aesfilingbytcl_amount"  name="rates_aesfilingbytcl_amount" value="<?php echo $rates_aesfilingbytcl; ?>"  /></td>
            </tr> 
           
            <tr  id="rates_docsreqd_group" name="rates_docsreqd_group" style="display:none" >
              <td><?php echo $entry_rates_docsreqd; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_docsreqd" name="rates_docsreqd" value="<?php echo $rates_docsreqd; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_docsreqd_amount" name="rates_docsreqd_amount" value="<?php echo $rates_docsreqd_amount; ?>" /></td>
            </tr> 
            
            <tr  id="rates_wgtsurcharge_group" name="rates_wgtsurcharge_group" style="display:none" >
              <td><?php echo $entry_rates_wgtsurcharge; ?></td>
              
              <td><input type="text" placeholder="$0.00" name="rates_wgtsurcharge" id="rates_wgtsurcharge"  value="<?php echo $rates_wgtsurcharge; ?>" class="form-control" /></td>
              <td></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_wgtsurcharge_amount" name="rates_wgtsurcharge_amount" value="<?php echo $rates_wgtsurcharge_amount; ?>"  /></td>
            </tr> 
           
            <tr  id="rates_line_haul_group" name="rates_line_haul_group" style="display:none" >
            	<td><?php echo $entry_linehaul; ?></td>
                <td><input type="text" placeholder="$0.00" id="rates_line_haul" name="rates_line_haul" value="<?php echo $rates_line_haul; ?>" class="form-control" /></td>
              	<td><input type="text" placeholder="$0.00" id="rates_line_haul_min" name="rates_line_haul_min" value="<?php echo $rates_line_haul_min; ?>" class="form-control" /></td>
              	<td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" name="rates_line_haul_amount" value="<?php echo $rates_line_haul_amount; ?>" /></td>
            </tr>    
           
            
            <tr  id="rates_other2_group" name="rates_other2_group"  >
              <td><input type="text" placeholder="(Flat)" id="entry_other2" name="entry_other2" value="<?php echo $entry_other2; ?>" class="form-control" /></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_other2" name="rates_other2" value="<?php echo $rates_other2; ?>" class="form-control" /></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" name="rates_other2_amount" value="<?php echo $rates_other2; ?>"  /></td>
            </tr>
             
            <tr  id="rates_other4_group" name="rates_other4_group" >
              <td><input type="text" placeholder="(W/M Rate)" id="entry_other4" name="entry_other4" value="<?php echo $entry_other4; ?>" class="form-control" /></td>
              <td><input type="text" placeholder="$0.00"  id="rates_other4" name="rates_other4" value="<?php echo $rates_other4; ?>" class="form-control"  /></td>
              <td><?php echo $rates_other4; ?></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_other4_amount"  name="rates_other4_amount" value="<?php echo $rates_other4_amount; ?>"  /></td>
            </tr>
          
            <tr  id="rates_other3_group" name="rates_other3_group" style="display:none" >
              <td><input type="text" placeholder="(W/M Rate)" id="entry_other3" name="entry_other3" value="<?php echo $entry_other3; ?>" class="form-control"/></td>
             
              <td><input type="text" placeholder="$0.00" id="rates_other3" name="rates_other3" value="<?php echo $rates_other3; ?>" class="form-control" /></td>
               <td><?php echo $rates_other3; ?></td>
              <td><input readonly="readonly" class="txt form-control" type="text" placeholder="$0.00" id="rates_other3_amount" name="rates_other3_amount" value="<?php echo $rates_other3_amount; ?>"  /></td>
            </tr>
           
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
      		
				<tr><td><b>Destination Charges</b></td></tr>
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
     		</div><!--"booking-content" -->
		</div><!-- end "trucking-pickup" -->		
		
		
		
        <div class="tab-pane" id="tab-costs" >
			<div class ="costs">
  				<div class=".col-lg-12 col-md-12 col-sm-12"><?php echo $costs_details; ?></div>
     		</div><!--"costs -content" -->
		</div><!-- end "tab-costs" -->		
		
			
		<div class="tab-pane" id="tab_notes" >
	    	<div class="tab_notes">
		    	<div class=".col-lg-12 col-md-12 col-sm-12"><?php echo $notes_details; ?></div>
		    	</div><!--"notes-content" -->   		
		</div><!-- end tab content-->
		
		<div class="tab-pane" id="tab-tracking_log" >
		  
    		<div class="tracking_log">
	   		 <div class=".col-lg-12 col-md-12 col-sm-12">
	   		
	   		 <div id="tracking"></div>
              <br />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                <div class="col-sm-10">
                  <textarea name="comment" rows="8" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"></textarea>
                </div>
              </div>
              <div class="text-right">
                <button id="button-tracking" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_tracking_add; ?></button>
              </div>
            </div>
            
	   		 
	   		 </div>
	    </div><!--"tracking-content" -->  
	
			</div><!-- end tab content-->
		</div><!-- end panel body-->	
	</div><!-- end panel-->
	</div><!-- end container--> 
          </form>
      </div><!-- end tab content -->
    </div>
    
    
  </div>

<script type="text/javascript">$(document).ready(function() {
	 var url_reload= 'index.php?route=service/quotations/insert&token=<?php echo $token; ?>';
	 
	 shortcut.add("Ctrl+Shift+1",function() {
		var quote_object = <?php echo json_encode($quote); ?>;
		
		if (typeof quote_object == 'undefined'){	
			alert("No Previous Quote information is avaiable!");
			var quote_object=null;
			
			
		} else {
		
			var input_quote_object = quote_object;
			var quote_no = input_quote_object["quote_no"];
			var quote = Object.keys(input_quote_object);
			var vals = Object.keys(input_quote_object).map(function (key) {  return input_quote_object[key];});
			var clone_quote = toObject(quote,vals);
			var clean = removeUnique();
			//var finish = refresh();
			alert('You just Cloned Quote number '+quote_no+'! Press F5 to load it.');
		}
	
	 });
	 
	 function toObject(names, values) {
		    var result = {};
		    for (var i = 0; i < names.length; i++){
			    result[names[i]] = values[i];
			    toSession(names[i], values[i]);
			 }
		    return result;
		}
	 
	 function toSession(name, value){
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  name, 'value': value});
	 }
	 
	 function removeUnique(){
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'quote_no', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'quotenumber', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'quotedate', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'quoteby', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'qtstatus', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'qtcomments', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'notes_ops', 'value': null});
		 

		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_oceanfreight', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_oceanfreight_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_baf', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_baf_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_thc', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_thc_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_precarriage', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_fuelsurcharge', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_forwarderadvance', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_oncarriage', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_hazardous', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_hazardous_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_hazsurcharge_cost', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_hazsurcharge_cost_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_bolfee_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_bolfee', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_fuelsurcharge', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_eufilingfee', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_eufilingfee_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_chassissurcharge', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_chassissurcharge_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_precarriage', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_precarriage_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_docsreqd', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_line_haul', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_line_haul_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_wgtsurcharge', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'truckingrate', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_other4', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'entry_other4', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_other3', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'entry_other3', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'rates_other2', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'entry_other2', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'special_rates_oceanfreight', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'special_rates_oceanfreight_min', 'value': null});
		 $.post('controller/setting/ajaxpersist.php', { 'fieldname' :  'truckingshipid', 'value': null});
		 
	 }
	 
	
	});
 
	 function refresh(){
			window.location= url_reload;
		 }
		//--></script> 
		
<script type="text/javascript"><!--
			$('#tracking').delegate('.pagination a', 'click', function(e) {
				e.preventDefault();
			
				$('#tracking').load(this.href);
			});
			
			$('#tracking').load('index.php?route=service/quotations/getHistory&token=<?php echo $token; ?>');
			
			$('#button-tracking').on('click', function(e) {
			  e.preventDefault();
			
				$.ajax({
					url: 'index.php?route=service/quotations/getHistory&token=<?php echo $token; ?>',
					type: 'post',
					dataType: 'html',
					data: 'comment=' + encodeURIComponent($('#tab-tracking_log textarea[name=\'comment\']').val()),
					beforeSend: function() {
						$('#button-tracking').button('loading');
					},
					complete: function() {
						$('#button-tracking').button('reset');
					},
					success: function(html) {
						$('.alert').remove();
			
						$('#tracking').html(html);
			
						$('#tab-tracking_log textarea[name=\'comment\']').val('');
					}
				});
			});
//--></script>

 <script type="text/javascript">
		 function DoSubmit() {
			 $("#formId").submit();
			}

		 $(function () {
	         $('#readydate').datetimepicker({
	         	
	         	onSelect: function() {DoSubmit();},
	         	daysOfWeekDisabled: [0, 6],
	            pickTime: false,
	            
	         });
		 });
		
		$(function(){
		  	 $('#readydate').on('change', DoSubmit);
		});
	 
		 
</script>

<script type="text/javascript"><!--

$(document).on("click", ".wsa", function(e) {

	var wsa = <?php echo $wsa; ?>;
	var url= 'index.php?route=service/quotations/updateRates&token=<?php echo $token; ?>';	
	var options =[{
			title:"Approve Weight Density",
			message:wsa,
			inputType: "password"

				}];
	bootbox.confirm(wsa , function (result) {
		
	    if (result) {
	    	var ApprovePassword = $("#ApprovePassword").val();
	    	var wrongPWD = $("#error_nocommodity_weight").val();
	    	var rates_wgtsurcharge = $("#rates_wgtsurcharge").val();
	    	
	    	
	    	if (ApprovePassword == "Samantha"){
		    	var commodity_density_approved = $("#commodity_density_approved").val();
		    	$.post("controller/setting/ajaxpersist.php", {"fieldname" : "commodity_density_approved","value":commodity_density_approved});
		    	$("input[name=\"commodity_density_approved\"]").val(commodity_density_approved);
		    	$.post("controller/setting/ajaxpersist.php", {"fieldname" : "rates_wgtsurcharge","value":rates_wgtsurcharge});
		    	$("input[name=\"rates_wgtsurcharge\"]").val(rates_wgtsurcharge);
		    	//window.location.href = url ;
		    	} else{
	    		$.post("controller/setting/ajaxpersist.php", {"fieldname" : "error_nocommodity_weight","value":"error_nocommodity_weight"+" Password is Incorrect!"});
	    		$.post("controller/setting/ajaxpersist.php", {"fieldname" : "rates_wgtsurcharge","value":rates_wgtsurcharge});
		    	$("input[name=\"rates_wgtsurcharge\"]").val(rates_wgtsurcharge);
		    	window.location.href = location ;
		    }
	    }
	}    

	); 
});

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

$("input[name=rates_docsreqd]").on('change',function() {
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

$("input[name=rates_destdocs]").on('change',function() {
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

$("input[name=rates_customsclearance]").on('change',function() {
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
	
	$("input[name=rates_bolfee_min]").on('change',function() {
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
	
	$("input[name=rates_eufilingfee_min]").on('change',function() {
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

	$("input[name=rates_oncarriage]").on('change',function(){
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

	$("input[name=rates_hazardous]").on('change',function(){
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


	$("input[name=rates_hazardous_min]").on('change',function(){
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
</script>
<script type="text/javascript">$(document).ready(function() {var rates_brokerage_percentage = $("input[name=rates_brokerage_percentage]").val();
	var ocean_freight = $("input[name=rates_oceanfreight_amount]").val();
	var rates_brokerage_total = (parseFloat(rates_brokerage_percentage)*parseFloat(ocean_freight)/100);	
	$('input[name=\'rates_brokerage_percentage_amount\']').val(rates_brokerage_total.toFixed(2));
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_amount', 'value':rates_brokerage_total});
	});

	$("input[name=rates_brokerage_percentage]").on('change',function(){
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

	
</script>	
<script type="text/javascript">$(document).ready(function() {var rates_other2 = $("input[name=rates_other2]").val();
	var rates_other2_sum = parseFloat(rates_other2)||0;	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other2_amount','value':rates_other2_sum.toFixed(2)});
	$('input[name=\'rates_other2_amount\']').val(rates_other2_sum.toFixed(2));});	
	
	$("input[name=rates_other2]").on('change',function(){	
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
</script>
<script type="text/javascript">$(document).ready(function() {var rates_other4 = $("input[name=rates_other4]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var rates_other4_sum = commodity_wm * parseFloat(rates_other4)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other4_amount','value':rates_other4_sum.toFixed(2)});
	$('input[name=\'rates_other4_amount\']').val(rates_other4_sum.toFixed(2));	}
	);
</script>
<script type="text/javascript">$(document).ready(function() {var rates_wgtsurcharge = $("input[name=rates_wgtsurcharge]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var rates_wgtsurcharge_sum = commodity_wm * parseFloat(rates_wgtsurcharge)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_wgtsurcharge_amount','value':rates_wgtsurcharge_sum.toFixed(2)});
	$('input[name=\'rates_wgtsurcharge_amount\']').val(rates_wgtsurcharge_sum.toFixed(2));	}
	);
</script>

<script type="text/javascript">$("input[name=rates_oceanfreight]").change(function(){
	var rates_oceanfreight =$("#rates_oceanfreight").val();
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_oceanfreight', 'value':rates_oceanfreight});
	$('input[name=\'rates_oceanfreight\']').val(rates_oceanfreight);
	});</script>
<script type="text/javascript">$("input[name=rates_oceanfreight_min]").change(function(){
	var rates_oceanfreight_min =$("#rates_oceanfreight_min").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_oceanfreight_min', 'value':rates_oceanfreight_min});
	$('input[name=\'rates_oceanfreight_min\']').val(rates_oceanfreight_min);
	});</script>	
<script type="text/javascript">$("input[name=rates_thc]").on('change',function(){
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
	);</script>	
<script type="text/javascript">$("input[name=rates_thc_min]").on('change',function(){	
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
	});	</script>
<script type="text/javascript">$("input[name=rates_aesfilingbytcl]").on('change',function(){
	var rates_aesfilingbytcl = $("#rates_aesfilingbytcl").val();
	var rates_aesfilingbytcl = parseFloat(rates_aesfilingbytcl).toFixed(2);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_aesfilingbytcl', 'value':rates_aesfilingbytcl});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_aesfilingbytcl_amount', 'value':rates_aesfilingbytcl});	
	$('input[name=\'rates_aesfilingbytcl\']').val(rates_aesfilingbytcl);$('input[name=\'rates_aesfilingbytcl_amount\']').val(rates_aesfilingbytcl);
	});</script>
<script type="text/javascript">$("input[name=rates_precarriage]").on('change',function(){	
	var rates_precarriage = $("#rates_precarriage").val();
	var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();

	}
	);
</script>
<script type="text/javascript">$("input[name=rates_precarriage_min]").on('change',function(){
	var rates_precarriage = $("#rates_precarriage").val();
	var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();
	var rates_precarriage_min2 = parseFloat(rates_precarriage_min);
	
	
	
	}
	);
</script>
<script type="text/javascript">$("input[name=truckercontact]").on('change',function(){
	var truckercontact = $("#truckercontact").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckercontact','value':truckercontact});
	$('input[name=\'truckercontact\']').val(truckercontact);}
	);
</script>
<script type="text/javascript">$("input[name=truckertelephone]").on('change',function(){
	var truckertelephone = $("#truckertelephone").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckertelephone','value':truckertelephone});
	$('input[name=\'truckertelephone\']').val(truckertelephone);}
	);
</script>
<script type="text/javascript">$("input[name=truckerfax]").on('change',function(){
	var truckerfax = $("#truckerfax").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckerfax','value':truckerfax});
	$('input[name=\'truckerfax\']').val(truckerfax);}
	);
</script>
<script type="text/javascript">$("input[name=truckingemail]").on('change',function(){
	var truckingemail = $("#truckingemail").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckingemail','value':truckingemail});
	$('input[name=\'truckingemail\']').val(truckingemail);}
	);
</script>
<script type="text/javascript">$("input[name=truckingrate]").on('change',function(){	
	var truckingrate = $("input[name=truckingrate]").val();
	var truckingrate_min_a = $("input[name=truckingrate_min]").val();
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate', 'value':truckingrate});	
	$('input[name=\'truckingrate\']').val(truckingrate);

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
<script type="text/javascript">$("input[name=truckingrate_min]").on('change',function(){
	var truckingrate = $("input[name=truckingrate]").val();
	var truckingrate_min = $("input[name=truckingrate_min]").val();
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_min', 'value':truckingrate_min});	
	$('input[name=\'truckingrate_min\']').val(truckingrate_min);
	
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
<script type="text/javascript">$("input[name=truckingrate_min_profit]").on('change',function(){
	
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
<script type="text/javascript">$("input[name=truckingrate_markup]").on('change',function(){
	
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
<script type="text/javascript">$("input[name=truckingrate_max_profit]").on('change',function(){
	
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
<script type="text/javascript">$("input[name=truckingrate_per_effect]").on('change',function(){
	
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
<script type="text/javascript">$("input[name=instruction]").on('change',function(){
	var instruction = $("#instruction").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'instruction','value':instruction});
	$('input[name=\'instruction\']').val(instruction);}
	);
</script>
<script type="text/javascript">$("textarea[name=bkpuspecinst]").on('change',function(){
	var bkpuspecinst = $("#bkpuspecinst").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'bkpuspecinst','value':bkpuspecinst});
	$('textarea[name=\'bkpuspecinst\']').val(bkpuspecinst);}
	);
</script>
<script type="text/javascript">$("input[name=pickupShipper]").on('change',function(){
	var pickupShipper = $("#pickupShipper").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupShipper','value':pickupShipper});
	$('input[name=\'pickupShipper\']').val(pickupShipper);}
	);
</script>
<script type="text/javascript">$("input[name=pickupAddress]").on('change',function(){
	var pickupAddress = $("#pickupAddress").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupAddress','value':pickupAddress});
	$('input[name=\'pickupAddress\']').val(pickupAddress);}
	);
</script>
<script type="text/javascript">$("input[name=pickupcontact]").on('change',function(){
	var pickupcontact = $("#pickupcontact").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupcontact','value':pickupcontact});
	$('input[name=\'pickupcontact\']').val(pickupcontact);}
	);
</script>
<script type="text/javascript">$("input[name=pickuptelephone]").on('change',function(){
	var pickuptelephone = $("#pickuptelephone").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickuptelephone','value':pickuptelephone});
	$('input[name=\'pickuptelephone\']').val(pickuptelephone);}
	);
</script>
<script type="text/javascript">$("input[name=pickupfax]").on('change',function(){
	var pickupfax = $("#pickupfax").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupfax','value':pickupfax});
	$('input[name=\'pickupfax\']').val(pickupfax);}
	);
</script>
<script type="text/javascript">$("input[name=pickupemail]").on('change',function(){
	var pickupemail = $("#pickupemail").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupemail','value':pickupemail});
	$('input[name=\'pickupemail\']').val(pickupemail);}
	);
</script>
<script type="text/javascript">$("input[name=pickupReceivingHrs]").on('change',function(){
	var pickupReceivingHrs = $("#pickupReceivingHrs").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupReceivingHrs','value':pickupReceivingHrs});
	$('input[name=\'pickupReceivingHrs\']').val(pickupReceivingHrs);}
	);
</script>
<script type="text/javascript">$("input[name=rates_chassissurcharge]").on('change',function(){
	var rates_chassissurcharge = $("#rates_chassissurcharge").val();	
	var rates_chassissurcharge_min = $("input[name=rates_chassissurcharge_min]").val();	
	var rates_chassissurcharge_min2 = parseFloat(rates_chassissurcharge_min);		
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();	
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));	
	var commodity_kg = $("input[name='commodity_kg']").val();	
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));	
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);		
	var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};		
	var ocean_sum = commodity_wm * parseFloat(rates_chassissurcharge)||0;
	if (ocean_sum<rates_chassissurcharge_min2){ocean_sum = rates_chassissurcharge_min2};	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_chassissurcharge', 'value':rates_chassissurcharge});	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_chassissurcharge_amount','value':ocean_sum} );		
	$('input[name=\'rates_chassissurcharge_amount\']').val(ocean_sum);	$('input[name=\'rates_chassissurcharge_min\']').val(rates_chassissurcharge);	
	$('input[name=\'rates_chassissurcharge\']').val(rates_chassissurcharge);
	});
</script>
<script type="text/javascript">$("input[name=rates_hazardous_min]").on('change',function(){	
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

<script type="text/javascript">$("input[name=Bkhtsr]").on('change',function(){	
	var Bkhtsr = $("#Bkhtsr").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'Bkhtsr','value':Bkhtsr} );
	$('input[name=\'Bkhtsr\']').val(Bkhtsr);	
	
	});	</script>
<script type="text/javascript">$("input[name=BkHtsm]").on('change',function(){	
	var BkHtsm = $("#BkHtsm").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'BkHtsm','value':BkHtsm} );
	$('input[name=\'BkHtsm\']').val(BkHtsm);	
	
	});	</script>
	
	
<script type="text/javascript">$("input[name=hazclass1]").on('change',function(){	
	var hazclass1 = $("#hazclass1").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass1','value':hazclass1} );
	$('input[name=\'hazclass1\']').val(hazclass1);	
	
	});	</script>
<script type="text/javascript">$("input[name=hazclass2]").on('change',function(){	
	var hazclass2 = $("#hazclass2").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass2','value':hazclass2} );
	$('input[name=\'hazclass2\']').val(hazclass2);	
	
	});	</script>	
<script type="text/javascript">$("input[name=hazclass3]").on('change',function(){	
	var hazclass3 = $("#hazclass3").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass3','value':hazclass3} );
	$('input[name=\'hazclass3\']').val(hazclass3);	
	
	});	</script>
<script type="text/javascript">$("input[name=un]").on('change',function(){	
	var un = $("#un").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'un','value':un} );
	$('input[name=\'un\']').val(un);	
	
	});	</script>	
<script type="text/javascript">$("input[name=commodity_hazardous_approval]").on('change',function(){	
	var commodity_hazardous_approval = $("#commodity_hazardous_approval").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'commodity_hazardous_approval','value':commodity_hazardous_approval} );
	$('input[name=\'commodity_hazardous_approval\']').val(commodity_hazardous_approval);	
	
	});	</script>		
<script type="text/javascript">$("input[name=rates_other3]").on('change',function(){
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
		})
</script>	
<script type="text/javascript">$("input[name=rates_other4]").on('change',function(){var rates_other4 = $("#rates_other4").val();
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
	
	}
	);
	</script>		
<script type="text/javascript">$("input[name=rates_forwarderadvance]").change(function(){
	var rates_forwarderadvance = $("#rates_forwarderadvance").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_forwarderadvance', 'value':rates_forwarderadvance});
	}
	);</script>
<script type="text/javascript">$("input[name=rates_wgtsurcharge]").change(function(){
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
<script type="text/javascript">$("input[name=rates_line_haul]").on('change',function(){
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
</script>		
<script type="text/javascript">$("input[name=rates_line_haul_min]").on('change',function(){
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
<script type="text/javascript">$("input[name=truckingdays]").on('change',function(){	
	var truckingdays = $("#truckingdays").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckingdays','value':truckingdays} );
	$('input[name=\'truckingdays\']').val(truckingdays);	
	
	});	
</script>



<script type="text/javascript">$(document).ready(function() {calculateSum();
	
	$(".txt").on("keydown keyup", function() {
	calculateSum();});}); 
	
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
</script>



<script type="text/javascript">

	function showHide() {
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
		
			
</script>

<script type="text/javascript"><!--- Checkboxes --->

	$("input[name='Bkcold']").change(function(){	
		var Bkcold =$("#Bkcold:checked").val();
		var personaleffects = 'false';
		var qtcoload = 'false'
			
		if (document.getElementById("personaleffects").checked){
		var Bkcold ='S';
		var personaleffects = 'true';	
		var qtcoload = 'false'	
		$("#commodity").val("Personal Effects, Not For Re-Sale");
			}	
		if (document.getElementById("coload").checked){
		var qtcoload = 'true'	
		}
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'personaleffects', 'value':personaleffects});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'Bkcold', 'value':Bkcold});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtcoload', 'value':qtcoload});
		
	});
	
	$("input[name=pickup]").change(function(){
		var pickup =$("#pickup").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickup', 'value':pickup})	;
		$('input[name=\'pickup\']').val(pickup);
	});
	
	$("input[name=destination_service]").on('change',function(){
		var destination_service =$("#destination_service").is(':checked') ? true : false;
		rateDisplay();
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'destination_service', 'value':destination_service})	;
		$('input[name=\'destination_service\']').val(destination_service);
		
	});
	
	$("input[name=destdocs]").on('change',function(){
		var destdocs =$("#destdocs").is(':checked') ? true : false;
		rateDisplay();
		
		if (destdocs==false){
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_destdocs', 'value':0.00})	;
		$('input[name=\'rates_destdocs\']').val('');
		} else {
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'destdocs', 'value':destdocs})	;
		$('input[name=\'destdocs\']').val(destdocs);
		}
	});
	$("input[name=customs]").on('change',function(){
		var customs =$("#customs").is(':checked') ? true : false;
		rateDisplay();
		
		if (customs==false){
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_customsclearance', 'value':0.00})	;
			$('input[name=\'rates_customsclearance\']').val('');
		} else {
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customs', 'value':customs})	;
			$('input[name=\'customs\']').val(customs);
		}
	});
	$("input[name=thc]").on('change',function(){
		var thc =$("#thc").is(':checked') ? true : false;
		
		if (thc==false){
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_thc', 'value':0.00})	;
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_thc_min', 'value':0.00})	;
			$('input[name=\'rates_thc\']').val('');
			$('input[name=\'rates_thc_min\']').val('');
		} else {
			$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'thc', 'value':thc})	;
			$('input[name=\'thc\']').val(thc);
		}

		rateDisplay();
		setCheckbox();
	});

	$("input[name=doormove]").change(function(){
		var doormove =$("#doormove").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'doormove', 'value':doormove});}	
		);
		


	//$("element").filter(function() { return $(this).css("display") == "none" });
</script>

<script type="text/javascript">$(document).ready(function() {
		setCheckbox();
		rateDisplay();
	
		});

		function setCheckbox(){
			var rates_destdocs = '<?php echo $rates_destdocs; ?>'; if (parseFloat(rates_destdocs)>0.01){	$("#destdocs").prop('checked', true); }
			var rates_customsclearance = '<?php echo $rates_customsclearance; ?>'; if (rates_customsclearance>0.01){	$("#customs").prop('checked', true); }
			var rates_thc = '<?php echo $rates_thc; ?>'; if (rates_thc>0.01){	$("#thc").prop('checked', true); }
			var hazardous = '<?php echo $hazardous; ?>'; if (hazardous=='true'){	$("#hazardous").prop('checked', true); }
			
		}
		
		function rateDisplay(){
			
			var rates_oceanfreight = $("#rates_oceanfreight").val();
			var rates_thc= $("#rates_thc").val();
			var rates_baf= $("#rates_baf").val();
			var rates_chassissurcharge= $("#rates_chassissurcharge").val();
			var rates_hazardous= $("input[name=rates_hazardous]").val();
			var rates_precarriage= $("input[name=rates_precarriage]").val();
			var rates_fuelsurcharge= $("input[name=rates_fuelsurcharge]").val();
			var rates_forwarderadvance= $("input[name=rates_forwarderadvance]").val();
			var rates_bolfee_min= $("input[name=rates_bolfee_min]").val();
			var rates_eufilingfee_min= $("input[name=rates_eufilingfee_min]").val();
			var rates_customsclearance= $("input[name=rates_customsclearance]").val();
			var rates_oncarriage= $("input[name=rates_oncarriage]").val();
			var rates_destdocs= $("input[name=rates_destdocs]").val();
			var rates_aesfilingbytcl= $("input[name=rates_aesfilingbytcl]").val();
			var rates_docsreqd= $("input[name=rates_docsreqd]").val();
			var rates_wgtsurcharge= $("input[name=rates_wgtsurcharge]").val();
			var rates_line_haul= $("input[name=rates_line_haul]").val();
			var entry_other3= $("#entry_other3").val();
			var rates_other3= $("#rates_other3").val();
			var destination_service =$("#destination_service").is(':checked') ? true : false;
			var destdocs =$("#destdocs").is(':checked') ? true : false;
			var thc =$("#thc").is(':checked') ? true : false;
			var customs =$("#customs").is(':checked') ? true : false;

		if (rates_oceanfreight<0){$("#rates_oceanfreight_group").removeAttr("style").hide();} else if (rates_oceanfreight>0){$("#rates_oceanfreight_group").removeAttr("style").show();};
		if (rates_thc<0.01){$("#rates_thc_group").removeAttr("style").hide();} else if (rates_thc>0.01){$("#rates_thc_group").removeAttr("style").show();};
		if (rates_baf<0){$("#rates_baf_group").removeAttr("style").hide();} else if (rates_baf>0){$("#rates_baf_group").removeAttr("style").show();};
		if (rates_chassissurcharge<0){$("#rates_chassissurcharge_group").removeAttr("style").hide();} else if (rates_chassissurcharge>0){$("#rates_chassissurcharge_group").removeAttr("style").show();};
		if (rates_hazardous<0){$("#rates_hazardous_group").removeAttr("style").hide();} else if (rates_hazardous>0){$("#rates_hazardous_group").removeAttr("style").show();};
		if (rates_precarriage<0){$("#rates_precarriage_group").removeAttr("style").hide();} else if (rates_precarriage>0){$("#rates_precarriage_group").removeAttr("style").show();};
		if (rates_fuelsurcharge<0){$("#rates_fuelsurcharge_group").removeAttr("style").hide();} else if (rates_fuelsurcharge>0){$("#rates_fuelsurcharge_group").removeAttr("style").show();};
		if (rates_forwarderadvance<0){$("#rates_forwarderadvance_group").removeAttr("style").hide();} else if (rates_forwarderadvance>0){$("#rates_forwarderadvance_group").removeAttr("style").show();};
		if (rates_bolfee_min<0){$("#rates_bolfee_min_group").removeAttr("style").hide();} else if (rates_bolfee_min>0){$("#rates_bolfee_min_group").removeAttr("style").show();};
		if (rates_eufilingfee_min<0){$("#rates_eufilingfee_min_group").removeAttr("style").hide();} else if (rates_eufilingfee_min>0){$("#rates_eufilingfee_min_group").removeAttr("style").show();};
		if (rates_customsclearance<0.01){$("#rates_customsclearance_group").removeAttr("style").hide();} else if (rates_customsclearance>0.01){$("#rates_customsclearance_group").removeAttr("style").show();};
		if (rates_oncarriage<0){$("#rates_oncarriage_group").removeAttr("style").hide();} else if (rates_oncarriage>0){$("#rates_oncarriage_group").removeAttr("style").show();};
		if (rates_destdocs<0.01){$("#rates_destdocs_group").removeAttr("style").hide();} else if (rates_destdocs>0.01){$("#rates_destdocs_group").removeAttr("style").show();};

		if (rates_aesfilingbytcl<0){$("#rates_aesfilingbytcl_group").removeAttr("style").hide();} else if (rates_aesfilingbytcl>0){$("#rates_aesfilingbytcl_group").removeAttr("style").show();};
		if (rates_docsreqd<0){$("#rates_docsreqd_group").removeAttr("style").hide();} else if (rates_docsreqd>0){$("#rates_docsreqd_group").removeAttr("style").show();};
		if (rates_wgtsurcharge<0){$("#rates_wgtsurcharge_group").removeAttr("style").hide();} else if (rates_wgtsurcharge>0){$("#rates_wgtsurcharge_group").removeAttr("style").show();};
		if (rates_line_haul<0){$("#rates_line_haul_group").removeAttr("style").hide();} else if (rates_line_haul>0){$("#rates_line_haul_group").removeAttr("style").show();};
		if (rates_other3<0){$("#rates_other3_group").removeAttr("style").hide();} else if (rates_other3>0){$("#rates_other3_group").removeAttr("style").show();};
		if (destination_service==false){$("#destination_service_group").removeAttr("style").hide();
		
		} else if (destination_service==true){
			$("#destination_service_group").removeAttr("style").show();
			$("#rates_oncarriage_group").removeAttr("style").show();
		}
		if (destdocs==false){$("#destdocs_group").removeAttr("style").hide();} else if (destdocs==true){$("#destdocs_group").removeAttr("style").show();	$("#destination_service_group").removeAttr("style").show();$('input[name=\'destination_service\']').attr( "checked" );};
		if (thc==false){$("#rates_thc_group").removeAttr("style").hide();} else if (thc==true){$("#rates_thc_group").removeAttr("style").show();	$("#destination_service_group").removeAttr("style").show();$('input[name=\'destination_service\']').attr( "checked" );};
		if (customs==false){$("#rates_customsclearance_group").removeAttr("style").hide();} else if (customs==true){$("#rates_customsclearance_group").removeAttr("style").show();	$("#destination_service_group").removeAttr("style").show();$('input[name=\'destination_service\']').attr( "checked" );};

		}

</script>

<script type="text/javascript">
	$("input[name=routedcargo]").change(function(){
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
	
	$("input[name=hazardous]").change(function(){
		var hazardous =$("#hazardous").is(':checked') ? true : false;
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'hazardous', 'value':hazardous});}	
		);
	
</script>


<script type="text/javascript">

	
	
	$('#button-trucking').on('click', function(event) {
		$('.nav-tabs a[href="#tab-trucking"]').tab('show');
		});
	
	$('#button-rates').on('click', function(event) {
		$('.nav-tabs a[href="#tab-rates"]').tab('show');
		});	
	
	$('#quote_info a').on('click', function(event) {
	    event.preventDefault()
	    $(this).tab('show')
	});
	
	// store the currently selected tab in the hash value
	$("ul.nav-tabs > li > a").on("shown.bs.tab", function (e) {
	    var id = $(e.target).attr("href").substr(1);
	    window.location.hash = id;
	});
	
	// on load of the page: switch to the currently selected tab
	var hash = window.location.hash;
	$('#quote_info a[href="' + hash + '"]').tab('show');

</script>
</div>

<?php echo $footer; ?>