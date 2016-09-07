<?php echo $header; ?>
<div class=current id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>

 	 <span class="FormNumber" >               
	  
	  <?php if ($quote_no) { ?><?php echo $quote_no;?> |<?php } ?>
      <?php if ($quotedate) { ?><?php echo $entry_quotedate; ?> <?php echo $quotedate; ?>  |<?php } else { ?><input type="hidden"  name="quotedate" value="<?php echo date("m-d-Y"); ?>"/><?php } ?>
      <?php if ($quoteby) { ?><?php echo $entry_quoteby; ?> <?php echo $quoteby;?>  |<?php } ?>
      <?php if ($qtstatus) { ?><?php echo $entry_status; ?> <?php echo $qtstatus; ?>  |<?php } ?>
      
      </span>
    
  </div>
  
 <?php if ($error_norates) { ?> <div class="warning"><?php echo $error_norates; ?></div> <?php } ?>
 <?php if ($error_warning) { ?> <div class="warning"><?php echo $error_warning; ?></div> <?php } ?>
 <?php if ($error_nocustomer) { ?> <div class="warning"><?php echo $error_nocustomer; ?></div> <?php } ?>
 <?php if ($error_notype) { ?>  <div class="warning"><?php echo $error_notype; ?></div>  <?php } ?>
 <?php if ($error_nocommodity) { ?>  <div class="warning" id="error_nocommodity" ><?php echo $error_nocommodity; ?></div>  <?php } ?>
 <?php if ($error_nocommodity_weight) { ?>  <div class="warning" id="error_nocommodity_weight" ><?php echo $error_nocommodity_weight; ?></div>  <?php } ?>
 <?php if ($error_noorigin) { ?>  <div class="warning"><?php echo $error_noorigin; ?></div>  <?php } ?>
 <?php if ($error_novessel) { ?>  <div class="warning"><?php echo $error_novessel; ?></div>  <?php } ?>
 <?php if ($error_prepaidcollect) { ?>  <div class="warning"><?php echo $error_prepaidcollect; ?></div>  <?php } ?>
 <?php if ($error_nodestination) { ?>  <div class="warning"><?php echo $error_nodestination; ?></div>  <?php } ?>
 <?php if ($error_noacceptorigin) { ?>  <div class="warning"><?php echo $error_noacceptorigin; ?></div>  <?php } ?>
 <?php if ($error_noacceptdest) { ?>  <div class="warning"><?php echo $error_noacceptdest; ?></div>  <?php } ?>
 <?php if ($error_readydatereqd) { ?>  <div class="warning"><?php echo $error_readydatereqd; ?></div>  <?php } ?>
 <?php if ($error_quotereqd) { ?>  <div class="warning"><?php echo $error_quotereqd; ?></div>  <?php } ?>
 <?php if ($error_trucktransitreqd) { ?>  <div class="warning"><?php echo $error_trucktransitreqd; ?></div>  <?php } ?>
  <?php if ($error_hazardous) { ?>  <div class="warning" id="error_hazardous"><?php echo $error_hazardous; ?></div>  <?php } ?>
  
 <?php if ($error_message) { ?> <div class="attention" id="error_message"><?php echo $error_message; ?></div> <?php } ?>
 <?php if ($error_restrictions_blcl) { ?>  <div class="attention"><?php echo $error_restrictions_blcl; ?></div>  <?php } ?>
 <?php if ($error_restrictions_corq) { ?>  <div class="attention"><?php echo $error_restrictions_corq; ?></div>  <?php } ?>
 <?php if ($error_restrictions_invoice) { ?>  <div class="attention"><?php echo $error_restrictions_invoice; ?></div>  <?php } ?>
 <?php if ($error_restrictions_insp) { ?>  <div class="attention"><?php echo $error_restrictions_insp; ?></div>  <?php } ?>
 <?php if ($error_restrictions_fri) { ?>  <div class="attention"><?php echo $error_restrictions_fri; ?></div>  <?php } ?>
 <?php if ($error_restrictions_cfri) { ?>  <div class="attention"><?php echo $error_restrictions_cfri; ?></div>  <?php } ?>
  <?php if ($warning_routed) { ?>  <div class="attention"><?php echo $warning_routed; ?></div>  <?php } ?>
  
 <?php if ($success) { ?> <div class="success"><?php echo $success; ?></div><?php } ?>
 
  <?php if ($drafts) { ?>
     <?php foreach ($drafts as $draft) { ?>
            <div class="attention">
	            <?php foreach ($draft['action'] as $actions) { ?>
	                 <a class="button" href="<?php echo $actions['href']; ?>"><?php echo $actions['text']; ?></a> 
	                 <i>&nbsp;&nbsp;&nbsp;&nbsp; click this </i><a class="button" href="<?php echo $actions['update']; ?>"><em>Update DRAFT</em> - <?php echo $actions['text']; ?></a> or to discard, 
	                 click <a class="button" href="<?php echo $actions['release']; ?>">Discard</a> to discard your draft.  Make this a <a class="button" href="<?php echo $actions['booking']; ?>">Booking</a> saves it.    
	            	 This drafts is available 30 min from last update,<b><?php echo $actions['goodtill']; ?></b>.
	            <?php } ?>
            </div>
         <?php } ?>
   <?php } ?>
   
  <div class="box">
    <div class="heading-quote">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
	 
    		  		 
      <div class="buttons">
      <span class="button-group" >
      <a href="<?php echo $quotesearch; ?>" class="button">Quotes</a>
      <a href="<?php echo $getWebQuotes; ?>" class="button">Web-Quotes </a>
      
      </span>
      
      <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
      
      <?php if ($quote_no) { ?><a href="<?php echo $print; ?>" class="button" TARGET="_blank" >Print Quote</a><?php } ?>
      
      
      <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      
		
	<div class="booking-customer">
      	<div class="booking-heading"><?php echo $text_customerdetails; ?></div>
			<div class="booking-content"><!--"booking-content" -->
      	
    	 <table  class="box">
			<tr><td><div style="float:left;width:50%;"><span class="required">* </span><a href="<?php echo $customersearch; ?>" title="Search for a Customer"><?php echo $entry_customer; ?></a>&nbsp;&nbsp;<?php echo $customer; ?>
			</div><div style="float:right;width:30%;">
			
				<?php if ($quote_no) { ?><input  type="text" placeholder="Quote #" name="quotenumber" value="<?php echo $quote_no; ?>" size="15" />
				<?php } else { ?>         <input  type="text" placeholder="Quote #" name="quotenumber" value="<?php echo $quotenumber; ?>" size="15" />
				<?php } ?>
			
			</div>
			</td>
			</tr>
	<?php if ($routedcargo  == "true") { ?>
		<tr>
    	 	<td align = "right">
    		Customer <input type="text" id="customerName" name="customerName" value="<?php echo $customerName ;?>" size="45"/></td></tr><tr><td align = "right">
    		
    	
    	 	</td>
    	 	</tr>
		<tr>
		<td align = "right">Shipper/<input name="customerSignator" id="customerSignator" type="text" value="<?php echo $customerSignator ;?>" size="45"/>
		</td></tr>
		
		<tr >
		<tr><td align = "right">Consignee/<input name="customerConsignee" id="customerConsignee" type="text" value="<?php echo $customerConsignee ;?>" size="45"/></td></tr>
		<tr>
		<td align = "right">
		Notify/<input name="customerNotify" id="customerNotify" type="text" value="<?php echo $customerNotify ;?>" size="45"/>
		</td>
		</tr>
			<tr>
			<td align="left">
				<input type="text" placeholder="{search for Agent contacts}" name="customercontact" value="<?php echo $customercontact; ?>" size="30" />
				<?php echo $add_contact ; ?> 
				<br> <span class="help">click for <a TARGET="_blank" href="<?php echo $tt_customer_contact ;?>" >Tech-Tip</a></span>
			</td>	
			</tr>
	<?php }else { ?>
    	 	<tr>
    	 	<span id="error_customer" class="required" style="display:none">*Please Complete.</span>
    	 	<td align = "right">
    	
    		
    		Customer <input type="text" name="customerName" value="<?php echo $customerName ;?>" size="45"/></td></tr><tr><td align = "right">
    		Address 1<input type="text" name="customerAddress1" value="<?php echo $customerAddress1 ;?>" size="45"/></td></tr><tr><td align = "right">
    		Address 2<input type="text" name="customerAddress2" value="<?php echo $customerAddress2 ;?>" size="45"/></td></tr><tr><td align = "right">
    		<input type="text" placeholder ="City" name="customerCity" value="<?php echo $customerCity ;?>" size="22"/>
    		<input name="customerState"  placeholder ="State" value="<?php echo $customerState ;?>" type="text" size="2"/>
    		<input name="customerZip" placeholder ="Zip" value="<?php echo $customerZip ;?>" type="text" size="5"/></td></tr><tr><td align = "right">
    		
    	
    	 	</td>
    	 	</tr>
    	 	<tr>
			<td align="left">
				<input type="text" placeholder="{search for contacts}" name="customercontact" value="<?php echo $customercontact; ?>" size="30" />
				<?php echo $add_contact ; ?> 
				<br> <span class="help">click for <a TARGET="_blank" href="<?php echo $tt_customer_contact ;?>" >Tech-Tip</a></span>
			</td>	
			</tr>
    <?php } ?>	 
			<tr><td><input type="text" placeholder="<?php echo $entry_custtelephone;?>"  id="custtelephone" name="custtelephone" value="<?php echo $custtelephone; ?>" size="20" />
			<input type="text" placeholder="<?php echo $entry_custfax;?>"  id="custfax" name="custfax" value="<?php echo $custfax; ?>" size="25" /></td>	
			</tr>
			<tr>
		  <td>
		  
		  <div id="customer-email" class=""></div>
		   <?php if ($email_to_send) { ?>
               
               	<?php foreach ($email_to_send as $to_send){ ?>
               	     <div id="customer">
               	     <?php echo $to_send; ?>
               	     </div>
               	<?php } ?>
               <?php } ?>
		  </td> 
		 </tr>	
			<?php if ($cpytosalesrep  == "true") { ?>	
		 <tr><td><input type="checkbox" id="cpytosalesrep" name="cpytosalesrep" checked="checked" value="<?php echo $cpytosalesrep; ?>"><?php echo $entry_cpytosalesrep; ?></td>	</tr>
		  
		  <?php } else {?>
		 <tr><td><input type="checkbox" id="cpytosalesrep" name="cpytosalesrep" value="<?php echo $cpytosalesrep; ?>"><?php echo $entry_cpytosalesrep; ?></td>	</tr>
		
		  
		  <?php } ?>
		  
		
			 
    	 </table>  

</div><!--"booking-customer" -->
		<?php if ($brokerage == 'true') { ?>
		<div class="booking-detail">
	      <div class="booking-heading">Brokerage Details</div>
			<div class="booking-content">
			<table>
				<tr>
				<td>Brokerage 
				<input type="text" placeholder="as  %" id ="rates_brokerage_percentage" name="rates_brokerage_percentage" value="<?php echo $rates_brokerage_percentage; ?>" size="5" />
				% of Ocean Freight
	       		</td>
				<td> Total:
				<input type="text" disabled = 'true'  placeholder="total" id="rates_brokerage_percentage_amount" name="rates_brokerage_percentage_amount" value="<?php echo $rates_brokerage_percentage_amount; ?>" size="5" />
				
				</tr>
				</table>
		</div><!--"booking-content" -->
		</div><!-- end booking-detail -->
		<?php } ?>
		
			</div><!--"booking-content" -->
		
			
		<div class="booking-service">
      	<div class="booking-heading"><?php echo $text_booking_service; ?></div>
			<div class="booking-content">

        <table >	
        <?php if ($pickup == "true") { ?>	
     	
		
    	 <tr>
			<td> </td>
			<td>
			<input type="text" placeholder="Point of <?php echo $entry_service_por; ?>" id ="service_por" name="service_por" value="<?php echo $service_por;?>" size="35" /> 
			<span class="help">	click for <a TARGET="_blank" href="<?php echo $tt_city_state ;?>" >Tech-Tip</a></span>
			</td>
			
			 <?php if ($service_por) { ?>
			<td><input type="text" placeholder="Zip Code" id="service_zip" name="service_zip" value="<?php echo $service_zip;?>" size="10" /> </td>
			<?php } else { ?>
			<td><input type="text" placeholder="Zip Code" id="service_zip"  name="service_zip" value="<?php echo $service_zip;?>" size="10" /> </td>
			
			<?php } ?>
		</tr>
		
		<?php } ?>
        		
    	 <tr>
			<td style="text-align: right"><a onmouseover="displayWarehouse()"><?php echo $entry_service_portofloading; ?></a></td>
			
			<td>
			<input type="search" placeholder="Origin CFS" name="service_portofloading"  value="<?php echo $service_portofloading;?>" size="25" />
			<input type="hidden" name="service_portofloading_code" value="<?php echo $service_portofloading_code; ?>" />
			</td>
             <td> <?php if ($viaOrigin) { ?>via <?php echo $viaOrigin; ?> <?php } ?></td>
		 </tr>
		 <tr>
		 <tbody id="warehouse_hidden" style="display:none">
		 <td></td>

		 <?php if ($warehouse_name) { ?><td>CFS code number <?php echo $service_warehouse;?><br>
		 <span class ="detail"><?php echo $warehouse_name;?>	
    	 <br><?php echo $warehouse_address;?>
    	 <br><?php echo $warehouse_city;?>
    	 <br><?php echo $warehouse_phone;?></span>
    	 <?php if ($warehouse_cutoff) { ?><br><br>Cut-off Date / Time <br><span class ="detail"> <?php echo $warehouse_cutoffday;?> <?php echo $warehouse_cutofftime;?></span><?php } ?>
    	 </td>
    	<?php } else { ?><td>No CFS selected
    	 <?php } ?>
    	 </tr>
		</tbody>
    	
    	 <tr>
			
			<td style="text-align: right"><a onmouseover="displayAgent()"><?php echo $entry_service_portofdest; ?></a></td>
			
    	 	<td>
    	 	<input type="search" placeholder="Destination CFS" name="service_portofdest"  value="<?php echo $service_portofdest;?>" size="25" />
			<input type="hidden" name="service_portofdest_code" value="<?php echo $service_portofdest_code; ?>" />
			</td>
			
			<td><?php if ($viaDest) { ?>via <?php echo $viaDest; ?> <?php } ?></td>
		</tr>
		
		 <tbody id="service_hidden" style="display:none">
		 <span id="errorservice_portofloading" class="required" style="display:none">*Please Complete.</span>
			 <tr>
		 <td></td>
		  <?php if ($agent_code) { ?><td >Service is <span class ="detail"><?php echo $service_name;?></span> with rotation <?php echo $service_rotation;?>.<br>  The agent is:
		  <span class ="detail"><br> <?php echo $agent_name;?> 
		  <br> <?php echo $agent_address1;?> 
		  <br> <?php echo $agent_address2;?> 
		  <br> <?php echo $agent_city;?> 
		  <br>(tel) <?php echo $agent_phone;?> 
		  <br> <?php echo $agent_email;?> </span>
		  </td>		
		 <?php } else { ?><td>No Service selected.  </td>
		 <?php } ?>
		  
		 
		 </tbody>	
		 </tr>
		<?php if ($doormove  == "true") { ?>
    	 <tr >
			<td ></td>
    	    <td><input type="text" placeholder="Point of <?php echo $entry_service_pod;?>" id="service_pod" name="service_pod" value="<?php echo $service_pod;?>" size="35" /> </td>
		 </tr>
		<?php } ?> 
		 
		
      	<?php if ($carrier_code) { ?>
      	<tr><td></td>  <td>Carrier: <b><?php echo $carrier_code; ?></b></td></tr>
      	<?php } ?>
         </table>  
				
    </div><!--"booking-content" -->
    
    	<div class="booking-type">
      		<div class="booking-heading">Options</div>
			<div class="booking-content">
		<table>
		<tr><td>
		
			<table class ="clickable">
			 <tr>
              	<td><span class="required">*</span>Type:</td>
             </tr>
             <tr>
             <?php if ($Bkcold=='C') { ?>
           	 <td style="text-align: left"><label class="radio" onchange="showHide()">
            	    <input type="radio" id="Bkcold" name="Bkcold" value="C" checked="checked"><?php echo $entry_coload; ?></td>
             </tr><tr>
                <td style="text-align: left"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="F" ><?php echo $entry_forward; ?></td>
             </tr><tr>   
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="S" ><?php echo $entry_shipper; ?></label></td>
             </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input style="display:" type="radio" id="personaleffects" name="Bkcold" value="false" ><?php echo $entry_personaleffects; ?></label></td>
                
                <?php } elseif ($Bkcold=='F'){ ?>
            <td style="text-align: left"><label class="radio" onchange="showHide()">
            	    <input type="radio" id="Bkcold" name="Bkcold" value="C"><?php echo $entry_coload; ?></label></td>
            </tr><tr>	    
                <td style="text-align: left"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="F" checked="checked"><?php echo $entry_forward; ?></label></td>
            </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="S" ><?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input style="display:" type="radio" id="personaleffects" name="Bkcold" value="false" ><?php echo $entry_personaleffects; ?></label></td>
                
                <?php } elseif ($Bkcold=='S' && $personaleffects == 'false'){ ?>
            <td style="text-align: left"><label class="radio" onchange="showHide()">
            	    <input type="radio" id="Bkcold" name="Bkcold" value="C"><?php echo $entry_coload; ?></label></td>
            </tr><tr>	    
                <td style="text-align: left"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="F" ><?php echo $entry_forward; ?></label></td>
            </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="S" checked="checked"><?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input style="display:" type="radio" id="personaleffects" name="Bkcold" value="false" ><?php echo $entry_personaleffects; ?></label></td>
     
        	              
			  <?php } elseif ($personaleffects == 'true') { ?>   
            <td style="text-align: left"><label class="radio" onchange="showHide()">
            	    <input type="radio" id="Bkcold" name="Bkcold" value="C"><?php echo $entry_coload; ?></label></td>
            </tr><tr>	    
                <td style="text-align: left"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="F" ><?php echo $entry_forward; ?></label></td>
            </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="S" ><?php echo $entry_shipper; ?></label></td>
            </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input style="display:" type="radio" id="personaleffects" name="Bkcold" value="true" checked="checked"><?php echo $entry_personaleffects; ?></label></td>
        	
                <?php } else { ?>
           	 <td style="text-align: left"><label class="radio" onchange="showHide()">
            	    <input type="radio" id="coload" name="Bkcold" value="C" checked="checked"><?php echo $entry_coload; ?></td>
             </tr><tr>
                <td style="text-align: left"><label class="radio" onclick = "document.location.href='index.php?route=service/quotations/updateFreightForwarder&token=<?php echo $token; ?>'" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="F" ><?php echo $entry_forward; ?></td>
             </tr><tr>   
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input type="radio" id="Bkcold" name="Bkcold" value="S" ><?php echo $entry_shipper; ?></label></td>
             </tr><tr>    
                <td style="text-align: left"><label class="radio" onchange="showHide()"><input style="display:none" type="radio" id="personaleffects" name="Bkcold" value="false" ><?php echo $entry_personaleffects; ?></label></td>
                
                <?php } ?>

			</tr>	
			</table>
			</td><td>
		<table class="clickable">	
		    <tr>
              	<td ><span class="required"></span>Options:</td>
            </tr>
            <tr>
              <td><label><?php if ($pickup == "true") { ?>
              
			  <input type="checkbox" id="pickup" name= "pickup" checked="checked"  onclick = "document.location.href='index.php?route=service/quotations/clearTrucking&token=<?php echo $token; ?>'" onchange="showHide()"  ><?php echo $entry_pickup; ?></label>
			  </td>
			  <?php } else { ?><input type="checkbox" id="pickup" name= "pickup" onclick = "document.location.href='index.php?route=service/quotations/clearTrucking&token=<?php echo $token; ?>'" onchange="showHide();"  ><?php echo $entry_pickup; ?></label>
			  </td><?php } ?>
			  
	          </tr><tr>
	          
	           <td><label>
	       <?php if ($doormove  == "true") { ?>
                <input type="checkbox"  onchange="self.location=self.location;showHide();" id="doormove" name="doormove"  value="true" checked="checked" ><?php echo $entry_doormove; ?></label></td>
         		 </tr>
         		<tr> 	  
                <td ><label>
                <?php if ($destdocs=='true'||$rates_destdocs >.01) { ?>
                <input type="checkbox" checked="checked" id="destdocs" name= "destdocs" value="true" >Prepare Destination Docs</label></td>
                 <?php }else { ?>
                <input type="checkbox" id="destdocs" name= "destdocs" value="false" >Prepare Destination Docs</label></td>
                <?php } ?>
                
         		</tr><tr>
         		
         		<?php if ($customs=='true') { ?>
         		<td ><input type="checkbox" checked="checked" id="customs" name= "customs" value="" >Customs Clearance Services</label></td>
         		 <?php }else { ?>
         		 <td ><input type="checkbox" id="customs" name= "customs" value="" >Customs Clearance Services</label></td>
         		 <?php } ?>
              </tr><tr>
         		
         		<?php if ($thc=='true') { ?>
         		<td ><input type="checkbox" checked="checked" id="thc" name= "thc" value="" >Terminal Handling Charges</label></td>
         		 <?php }else { ?>
         		 <td ><input type="checkbox" id="thc" name="thc" value="" >Terminal Handling Charges</label></td>
         		 <?php } ?>
              </tr>
         		 
           <?php } else { ?>
         	     <input type="checkbox" onchange="self.location=self.location;showHide();" id="doormove" name="doormove"  value="false"  ><?php echo $entry_doormove; ?><?php } ?>
         		 </label></td>
	         </tr>
	        
	        <?php if ($Bkcold=='F'){ ?>
	        
	     <tbody id="brokerage_hidden" name="brokerage_hidden" style="">
			 <tr> 	  
                <td ><label> 
                <?php if ($brokerage=='true') { ?>   
                <input type="checkbox" checked="checked" id="brokerage" name= "brokerage" value="" onchange="showHide()"> <?php echo $entry_brokerage; ?></label></td>	
                 <?php }else { ?>
                <input type="checkbox" id="brokerage" name= "brokerage" value="" onchange="showHide()"> <?php echo $entry_brokerage; ?></label></td>	    
                  <?php } ?>  
             </tr>
               
         </tbody>
	            <?php } ?>
	          
			 <tr> 
              
			  <td ><label><?php if ($routedcargo=='true') { ?>
			  <input type="checkbox" id = "routedcargo" name="routedcargo" value="true" checked="checked"  onchange="showHide()"><?php echo $entry_routedcargo; ?>
              	  <?php } else { ?><input type="checkbox"  id = "routedcargo" name="routedcargo" value="false"  onchange="showHide()" ><?php echo $entry_routedcargo; ?><?php } ?>
              	  </label></td>
              </tr>
              
         <tbody id="brokerage_hidden" style="display:none">
			 <tr> 	  
                <td ><label>
                <input type="checkbox" id="brokerage" name= "brokerage" value="<?php echo $brokerage; ?>" onchange="showHide()"><?php echo $entry_brokerage; ?></label></td>
         		  
               </tr>
         </tbody>
	            <tr> 
              
			  <td><label><?php if ($hazardous=='true') { ?>
			  <input type="checkbox" id = "hazardous" name="hazardous" value="true" checked="checked" onclick = "document.location.href='index.php?route=service/quotations/clearHazardous&token=<?php echo $token; ?>'"   onchange="showHide()"><?php echo $entry_hazardous; ?>
              	  <?php } else { ?>
              <input type="checkbox"  id = "hazardous" name="hazardous" value="false"  onchange="showHide()" ><?php echo $entry_hazardous; ?>
              
              <?php } ?>
              	  </label></td>
              </tr>
              
              <?php if ($service_portofdest_charge == 'true') { ?>	
              <tr> <td>	<input type="checkbox" id ="service_portofdest_charge" name ="service_portofdest_charge" checked="checked" value="<?php echo $service_portofdest_charge; ?>">Show Destination Charges
           	</td></tr>	
			<?php }else { ?>	
				 <tr> <td><input type="checkbox" id="service_portofdest_charge" name="service_portofdest_charge" value="<?php echo $service_portofdest_charge; ?>">Show Destination Charges
				</td></tr>
			<?php } ?>
              
              <?php if  ($personaleffects == 'true') { ?> 
              	<?php if  ($qtshowcft == 'true') { ?>
              <tr> <td>
               <input type="checkbox" id = "qtshowcft" name="qtshowcft" value="true" checked="checked"  onchange="showHide()">Show PE Rates as C/Ft
              </td> </tr> 
                  <?php } else {?>
              <tr> <td>
               <input type="checkbox" id = "qtshowcft" name="qtshowcft" value="false" onchange="showHide()">Show PE Rates as C/Ft
              </td> </tr>     
                  <?php } ?>
              <?php } ?>
              
              
              
	     </table>
	     </td><td>
	           <table>
	           
	             <tr><td>
	             <?php if  ($transittime) { ?>
	             Transit Time: <b><?php echo $transittime; ?> </b>
	             <?php } ?>
	             </td></tr><tr>
	             
	             <td><input type="text" name="day_to_expire" value="30" size="3" /> Days to Expire</td>
	             </tr><tr>
	             <td><input disabled = "true" type="text" name="date_expire" value="<?php echo $date_expire; ?>" size="9" /> Exp Date</td>
	             </tr>
	            
	             
	           </table>
	           
	      </table>
	      </td></tr>
	      
	         </table>
             </table>
	       
			</div><!--"booking-content" -->
		</div><!-- end booking-type -->	
    
    
		</div><!-- end booking-service -->
			
		<div class="commodity-wm">
      			<div class="booking-heading"><?php echo $text_commodity_wm; ?></div>
			<div class="booking-content">
			    <table >
			    <tr>
            <td>
            <input type="text" placeholder="<?php echo $entry_customerref;?>" id="customerref" name="customerref" value="<?php echo $customerref; ?>" size="47" />
           	</td>
			  </tr> 
			<tr>
            <td>
             <?php if ($personaleffects == 'true') { ?> 
            <input disabled = "true" type="text" id="commodity" name="commodity" value="Personal Effects, Not For Re-Sale" size="47" />
              <?php } else { ?> 
               <input type="text" placeholder="<?php echo $entry_commodity;?>" id="commodity" name="commodity" value="<?php echo $commodity; ?>" size="47" />
           	  <?php }  ?> 
            </td>
            </tr>
           
            
            </table>
			<table id="clickable" class="clickable" >
			    	<tr>
			    	<td>
			    	<?php if ($commodity_norider) { ?><span class="required"><?php echo $commodity_norider;?></span><?php } ?>
			    	</td>
			    	<td>&nbsp;<?php echo $entry_commodity_weight; ?></td>
			    	<td>&nbsp;<?php echo $entry_commodity_measure; ?>
			    	</td><td></td>
			    	</tr>
			    	<tr>
			    	
			    	<td>
			    	<input type="text" placeholder="<?php echo $entry_commodity_pieces;?>" name="commodity_pieces" value="<?php echo $commodity_pieces; ?>" size="10" />
			    	</td>
			    	
			    	<td>
			    	<input type="text" placeholder="<?php echo $entry_commodity_lbs;?>" id="commodity_lbs" name="commodity_lbs" value="<?php echo $commodity_lbs; ?>" size="10" 
			    	onChange="if(document.getElementById('commodity_kg').value!=document.getElementById('commodity_lbs').value * 0.45359237) {UseNum=document.getElementById('commodity_lbs').value * 0.45359237;document.getElementById('commodity_kg').value=UseNum.toFixed(1)};" 
			    	/>lbs
			    	</td>
			    	<td><input type="text" placeholder="<?php echo $entry_commodity_cft;?>" id="commodity_cft" name="commodity_cft" value="<?php echo $commodity_cft; ?>" size="10" 
					onchange="if (document.getElementById('commodity_cbm').value!=document.getElementById('commodity_cft').value * 0.0283168466) {UseNum=document.getElementById('commodity_cft').value * 0.0283168466 ;document.getElementById('commodity_cbm').value=UseNum.toFixed(3);};"
			    	/>Cft
			    	</td>
			    	
			    	</tr>
			    	<tr>
			    	<td>
			    	</td>
			    	
			    	<td><input  type="text" placeholder="<?php echo $entry_commodity_kg;?>" id="commodity_kg" name="commodity_kg" value="<?php echo $commodity_kg; ?>" size="10" 
			    	onChange="if (document.getElementById('commodity_lbs').value!=document.getElementById('commodity_kg').value / 0.45359237) {UseNum=document.getElementById('commodity_kg').value / 0.45359237 ;document.getElementById('commodity_lbs').value=UseNum.toFixed(0);}" 
			    	/>kg
			    				    	</td>
			    	<td><input  type="text" placeholder="<?php echo $entry_commodity_cbm;?>" id="commodity_cbm" name="commodity_cbm" value="<?php echo $commodity_cbm; ?>" size="10" 
			    	
					onchange="if (document.getElementById('commodity_cft').value!=document.getElementById('commodity_cbm').value / 0.0283168466) {UseNum=document.getElementById('commodity_cbm').value / 0.0283168466 ;document.getElementById('commodity_cft').value=UseNum.toFixed(0);};"
			    	/>CbM
			    	</td>
			    	
			    	
			    	
			    	</tr>
			</table>
			
			  
			    <table class = "box">
			<tr>
			 <td><input type="text" placeholder="Package Type" name="commodity_package_type" id="commodity_package_type" value="<?php echo $commodity_package_type; ?>" size="47" /></td>
			</tr>    
			<tr>
            <td>
             <?php if ($qtcomments) { ?>
            <?php echo nl2br($qtcomments); ?><br>
            <?php } ?>
            <textarea type="text" placeholder="Additional Comments" id="comments" name="comments" rows="3" cols="44" /><?php echo $comments; ?></textarea>
            </td>
            </tr>
            <tr>
            <td><input type="text" placeholder="H.S. Code if provided" name="" value="" size="47" /></td>
            </tr>
			    </table>
			    
        	</div><!--"booking-content" -->
		
			<div align="right"><br><a href="<?php echo $getRates; ?>" class="button">Rates</a></div>
			
			<?php if ($pickup == "true") { ?>  <br>
			<div align="right"><a href="<?php echo $getTrucker; ?>" class="button">List Truckers</a></div>
			<?php } ?>
			
			
			
		</div><!-- end commodity-wm -->	
		
		
	</div>
	
	
	
	<div>
      <div id="tabs" class="htabs">
      <a href="#tab-rates"><?php echo $tab_rates; ?></a>
      <?php if ($pickup == "true") { ?>  	
	    <div id = "trucking_tab" ><a href="#tab-trucking"><?php echo $tab_trucking; ?></a></div>
	<?php } else { ?>
		<div id = "trucking_tab" style="display:none;"><a href="#tab-trucking"><?php echo $tab_trucking; ?></a></div>
	<?php } ?> 
      <a href="#tab_booking_cost"><?php echo $tab_booking_cost; ?></a>
      <div id = "hazardous_tab" style="display:none;"><a href="#tab-hazardous"><?php echo $tab_hazardous; ?></a></div>
      <a href="#tab-notes"><?php echo $tab_notes; ?></a>
      <a href="#tab-restrictions"><?php echo $tab_restrictions; ?></a>
     
      <a href="#tab-history"><?php echo $tab_trackinglog; ?></a>
      </div>
      
   <div id="tab-rates">
          
          <div class ="rates-booking">
      				<div class="booking-heading"><?php echo $text_rate_detail; ?></div>
				<div class="booking-content">
				
		<table>
            <tr>
              <td><?php echo $entry_rateitem; ?></td>
              <td><?php echo $entry_rate; ?></td>
              <td><?php echo $entry_minflat; ?></td>
              <td><?php echo $entry_amount; ?></td>
              
            </tr>
<!--- // Rates calc or entered // --->            
<!--- // Rates from previous // --->           	

           
            
            <?php if ($rates_oceanfreight) { ?>
            <tr>
              <td><?php echo $entry_rates_oceanfreight; ?></td>
              <td><input disabled = "true" type="text" placeholder="$0.00" id ="rates_oceanfreight" name="rates_oceanfreight" value="<?php echo $rates_oceanfreight; ?>" size="10" /></td>
              <td><input disabled = "true" type="text" placeholder="$0.00" id ="rates_oceanfreight_min" name="rates_oceanfreight_min" value="<?php echo $rates_oceanfreight_min; ?>" size="10" /></td>
              <td ><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id =name="rates_oceanfreight_amount" name="rates_oceanfreight_amount" value="<?php echo $rates_oceanfreight_amount; ?>" size="10" /></td>
            
            </tr>
        
            <?php }else ?>
            <?php if ($rates_thc ||$thc=='true') { ?>
            	 <tr>
              <td><?php echo $entry_rates_thc; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_thc"  name="rates_thc" value="<?php echo $rates_thc; ?>" size="10" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_thc_min" name="rates_thc_min" value="<?php echo $rates_thc_min; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_thc_amount" value="<?php echo $rates_thc; ?>" size="10" /></td>
            </tr>    
             <?php }else ?>
              <?php if ($rates_baf && $rates_baf>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_baf; ?></td>
              <td><input disabled = "true" type="text" placeholder="$0.00" id="rates_baf" name="rates_baf" value="<?php echo $rates_baf; ?>" size="10" /></td>
              <td><input disabled = "true" type="text" placeholder="$0.00" id="rates_baf_min" name="rates_baf_min" value="<?php echo $rates_baf_min; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_baf_amount" name="rates_baf_amount" value="<?php echo $rates_baf_amount; ?>" size="10" /></td>
            </tr>
            <?php }else ?>
            
              <?php if ($rates_chassissurcharge && $rates_chassissurcharge>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_chassissurcharge; ?></td>
              <td><input type="text" placeholder="$0.00" id="rates_chassissurcharge" name="rates_chassissurcharge" value="<?php echo $rates_chassissurcharge; ?>" size="10" /></td>
              <td><input type="text" placeholder="$0.00" id="rates_chassissurcharge_min" name="rates_chassissurcharge_min" value="<?php echo $rates_chassissurcharge_min; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_chassissurcharge_amount" value="<?php echo $rates_chassissurcharge_amount; ?>" size="10" /></td>
            </tr> 
            <?php }else ?>
           
             <?php if (($rates_hazardous && $rates_hazardous>'0.00') || $rates_hazardous_min >'0.00'  ) { ?>
            <tr>
              <td><?php echo $entry_rates_hazsurcharge; ?></td>
              <td><input type="text" placeholder="$0.00" name="rates_hazardous" id="rates_hazardous"  value="<?php echo $rates_hazardous; ?>" size="10" /></td>
              <td><input type="text" placeholder="$0.00" name="rates_hazardous_min"  id="rates_hazardous_min" value="<?php echo $rates_hazardous_min; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_hazardous_amount" value="<?php echo $rates_hazardous_amount; ?>" size="10" /></td>
            </tr>
            <?php }else ?>
            <?php if ($rates_precarriage) { ?>
            
	            <tr>
	              <td><?php echo $entry_rates_precarriage; ?></td>
	              <td><input type="text" placeholder="$0.00" id="rates_precarriage" name="rates_precarriage" value="<?php echo $rates_precarriage; ?>" size="10" /></td>
	              <td><input type="text" placeholder="$0.00" id="rates_precarriage_min" name="rates_precarriage_min" value="<?php echo $rates_precarriage_min; ?>" size="10" /></td>
	              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_precarriage_amount" value="<?php echo $truckingrate; ?>" size="10" /></td>
	            </tr>
	            <?php } ?>
          
            <?php if ($rates_fuelsurcharge) { ?>
            <tr>
              <td><?php echo $entry_rates_fuelsurcharge; ?></td>
              <td><input type="text"  placeholder="0" name="entry_rate" value="<?php echo $rates_fuelsurcharge; ?>" size="10" /></td>
              <td>%</td>
              <td><input class="txt" type="text" placeholder="$0.00" name="entry_amount" value="<?php echo $rates_fuelsurcharge_amount; ?>" size="10" /></td>
            </tr>
             <?php }else ?>
             <?php if ($rates_forwarderadvance) { ?>
            <tr>
              <td><?php echo $entry_rates_forwarderadvance; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" onchange="self.location=self.location" name="rates_forwarderadvance" value="<?php echo $rates_forwarderadvance; ?>" size="10" /></td>
              <td><input class="txt" type="text" placeholder="$0.00" name="rates_forwarderadvance_amount" value="<?php echo $rates_forwarderadvance; ?>" size="10" /></td>
            </tr> 
            <?php }else ?>
            
             <?php if ($rates_bolfee_min && $rates_bolfee_min>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_bolfee; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_bolfee_min" name="rates_bolfee_min" value="<?php echo $rates_bolfee_min; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_bolfee_amount" name="rates_bolfee_amount" value="<?php echo $rates_bolfee_amount; ?>" size="10" /></td>
            </tr>
            <?php }else ?>
             <?php if ($rates_eufilingfee_min && $rates_eufilingfee_min>'0.00') { ?>
            <tr>
              <td><?php echo $entry_rates_eufilingfee; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_eufilingfee_min" value="<?php echo $rates_eufilingfee_min; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_eufilingfee_amount" value="<?php echo $rates_eufilingfee; ?>" size="10" /></td>
            </tr>
            <?php }else ?>
           
           
            <?php if ($rates_customsclearance || $customs=='true') { ?>
            <tr>
              <td><?php echo $entry_rates_customsclearance; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_customsclearance"  name="rates_customsclearance" value="<?php echo $rates_customsclearance; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_customsclearance_amount" value="<?php echo $rates_customsclearance; ?>" size="10" /></td>
            </tr> 
            <?php }else ?>
            <?php if ($rates_wgtsurcharge) { ?>
            <tr>
              <td><?php echo $entry_rates_wgtsurcharge; ?></td>
              
              <td><input type="text" placeholder="$0.00" name="rates_wgtsurcharge" value="<?php echo $rates_wgtsurcharge; ?>" size="10" /></td>
              <td></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_wgtsurcharge_amount" name="rates_wgtsurcharge_amount" value="<?php echo $rates_wgtsurcharge; ?>" size="10" /></td>
            </tr> 
            <?php }else ?>
            
            <?php if ($rates_oncarriage>.01 || $doormove =='true') { ?>
             <tr>
              <td><?php echo $entry_rates_oncarriage; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_oncarriage" name="rates_oncarriage" value="<?php echo $rates_oncarriage; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_oncarriage_amount" value="<?php echo $rates_oncarriage; ?>" size="10" /></td>
            </tr>
             <?php }else ?>
           
            <?php if ($rates_aesfilingbytcl) { ?>
            <tr>
              <td><?php echo $entry_rates_aesfilingbytcl; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_aesfilingbytcl" name="rates_aesfilingbytcl" value="<?php echo $rates_aesfilingbytcl; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_aesfilingbytcl_amount" value="<?php echo $rates_aesfilingbytcl; ?>" size="10" /></td>
            </tr> 
             <?php }else ?>
             <?php if ($rates_destdocs) { ?>
            <tr>
              <td><?php echo $entry_rates_destdocs; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_destdocs"  id="rates_destdocs" value="<?php echo $rates_destdocs; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_destdocs_amount" id="rates_destdocs_amount" value="<?php echo $rates_destdocs; ?>" size="10" /></td>
            </tr>
            <?php }else ?>
             <?php if ($rates_docsreqd) { ?>
            <tr>
              <td><?php echo $entry_rates_docsreqd; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" name="rates_docsreqd" value="<?php echo $rates_docsreqd; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')"  placeholder="$0.00" name="rates_docsreqd_amount" value="<?php echo $rates_docsreqd_amount; ?>" size="10" /></td>
            </tr> 
             <?php }else ?>
           	
            <?php if ($rates_line_haul) { ?>
            <tr>
            	<td><?php echo $entry_linehaul; ?></td>
                <td><input type="text" placeholder="$0.00" id="rates_line_haul" name="rates_line_haul" value="<?php echo $rates_line_haul; ?>" size="10" /></td>
              	<td><input type="text" placeholder="$0.00"  id="rates_line_haul_min" name="rates_line_haul_min" value="<?php echo $rates_line_haul_min; ?>" size="10" /></td>
              	<td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" id="rates_line_haul_amount;"  name="rates_line_haul_amount" value="<?php echo $rates_line_haul_amount; ?>" size="10" /></td>
            </tr>    
                  <?php } ?>
                  
           
            <tr>
              <td><input type="text" placeholder="(Flat)" id="entry_other2" name="entry_other2" value="<?php echo $entry_other2; ?>" size="30" /></td>
              <td></td>
              <td><input type="text" placeholder="$0.00" id="rates_other2"name="rates_other2" value="<?php echo $rates_other2; ?>" size="10" /></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" name="rates_other2_amount" value="<?php echo $rates_other2; ?>" size="10" /></td>
            </tr>
            
            <tr>
              <td><input type="text" placeholder="(W/M Rate)" id="entry_other4" name="entry_other4" value="<?php echo $entry_other4; ?>" size="30" /></td>
              <td><input type="text" placeholder="$0.00"  id="rates_other4" name="rates_other4" value="<?php echo $rates_other4; ?>" size="10"  /></td>
              <td></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')"  placeholder="$0.00" id="rates_other4_amount"  name="rates_other4_amount" value="<?php echo $rates_other4_amount; ?>" size="10" /></td>
            </tr>
             <?php if ($rates_other3 !=null && $rates_other3 > '0.00' ) { ?>
            <tr>
              <td><input type="text" placeholder="(W/M Rate)" id="entry_other3" name="entry_other3" value="<?php echo $entry_other3; ?>" size="30" /></td>
             
              <td><input type="text" placeholder="$0.00" id="rates_other3" name="rates_other3" value="<?php echo $rates_other3; ?>" size="10" /></td>
               <td><?php echo $rates_other3; ?></td>
              <td><input class="txt" type="text" onblur="calcTotal(this, 'tot')" placeholder="$0.00" id="rates_other3_amount" name="rates_other3_amount" value="<?php echo $rates_other3_amount; ?>" size="10" /></td>
            </tr>
             <?php } ?>           
            
            <tr id="summation">
			        <td>&nbsp;</td>
			        <td colspan = "2">Est. Total (Based on Pcs/Wgt/Cube):</td>
			        <td class="total" align="left">$<span id="sum">0</span></td>
			    </tr>
			    			        
            </table>
	
            </div><!--"booking-content" -->
            
            </div>
            
    <div class ="rates-booking">
      				<div class="booking-heading">Cost Detail</div>
				<div class="booking-content">
			<table> 	
				
			
				
			  <tr>
             <tr><td>Costs:</td>
             
              <td>Cost Rate</td>
              <td>Cost Min</td>
              <td>Cost Amount</td>
              
            </tr>
			
           
            <?php if ($truckingrate_sell) { ?>
            <tr>
              <td><?php echo $entry_rates_precarriage; ?></td>
              <td><input disabled = "true" type="text" placeholder="$0.00" name="truckingrate" value="<?php echo $truckingrate; ?>" size="10" /></td>
              <td><input disabled = "true" type="text" placeholder="$0.00" name="truckingrate_min" value="<?php echo $truckingrate_min; ?>" size="10" /></td>
              <td><input   type="text" placeholder="$0.00" name="" value="" size="10" /></td>
            </tr>
            <?php }else ?>
            
             <?php if ($rates_destdocs || $destdocs=='true') { ?>
            <tr>
              <td><?php echo $entry_rates_destdocs; ?></td>
              <td></td>
              <td><input type="text" placeholder="$0.00"  id="costs_destdocs" name="costs_destdocs" value="<?php echo $costs_destdocs; ?>" size="10" /></td>
              <td><input type="text"  disabled = "true" placeholder="$0.00" id="costs_destdocs" name="costs_destdocs" value="<?php echo $costs_destdocs ?>" size="10" /></td>
            </tr>
            <?php }else ?>
           <?php if ($rates_thc ||$thc=='true') { ?>
            	 <tr>
              <td><?php echo $entry_rates_thc; ?></td>
              <td><input type="text" placeholder="$0.00" id="qtthccostr"  name="qtthccostr" value="<?php echo $qtthccostr; ?>" size="10" /></td>
              <td><input type="text" placeholder="$0.00" id="qtthccostm" name="qtthccostm" value="<?php echo $qtthccostm; ?>" size="10" /></td>
              <td><input   type="text" disabled = "true" placeholder="$0.00" id="cost_thc_amount" name="cost_thc_amount" value="<?php echo $cost_thc_amount; ?>" size="10" /></td>
            </tr>    
             <?php }else ?>
             
            <?php if ($rates_hazardous || $hazardous=='true') { ?>
            <tr>
              <td><?php echo $entry_rates_hazsurcharge; ?></td>
              <td><input  type="text" placeholder="$0.00" id="qthazcost" name="qthazcost" value="<?php echo $qthazcost; ?>" size="10" /></td>
              <td><input  type="text" placeholder="$0.00" id="qthazcostmin" name="qthazcostmin" value="<?php echo $qthazcostmin; ?>" size="10" /></td>
              <td><input  type="text" disabled = "true" placeholder="$0.00" id="cost_haz_amount" name="cost_haz_amount" value="<?php echo $cost_haz_amount ?>" size="10" /></td>
            </tr>
            <?php }else ?>
            
            <?php if ($rates_customsclearance || $customs=='true') { ?>
            <tr>
              <td><?php echo $entry_rates_customsclearance; ?></td>
              <td>&nbsp;</td>
              <td><input type="text" placeholder="$0.00" id="qtcustccost"  name="qtcustccost" value="<?php echo $qtcustccost ?>" size="10" /></td>
              <td><input type="text" disabled = "true" placeholder="$0.00"  id="cost_clearance_amount" name="cost_clearance_amount" value="<?php echo $cost_clearance_amount ?>" size="10" /></td>
            </tr> 
            <?php }else ?>
            
            <tr>
             <?php if ($rates_oncarriage>.01 || $doormove =='true') { ?>
              <td><?php echo $entry_rates_oncarriage; ?></td>
              <td>&nbsp;</td>
              <td><input type="text" placeholder="$0.00" id="qtoncarrcost" name="qtoncarrcost" value="<?php echo $qtoncarrcost; ?>" size="10" /></td>
              <td><input type="text" disabled = "true" placeholder="$0.00" id="cost_oncarriage_amount" name="cost_oncarriage_amount" value="<?php echo $cost_oncarriage_amount; ?>" size="10" /></td>
            </tr>
             
            <?php } ?>
			
			</table>
				
				
				
				
				
				 </div><!--"booking-content" -->		
   		</div><!-- end "rates-booking" -->
            
            <div class ="rates-booking">
      				<div class="booking-heading">Destination Charges</div>
				<div class="booking-content">
				<table>
				<tr>
				<td>
				<?php if ($qtshowdestc == 'true') { ?>	
				<input type="checkbox" name = "qtshowdestc" id= "qtshowdestc" checked="checked">Show Destination Charges
			<?php }else { ?>	
				<input type="checkbox" name = "qtshowdestc" id= "qtshowdestc" >Show Destination Charges
			<?php } ?>
				<?php if ($personaleffects == 'true') { ?>
				<input type="checkbox" name = "" >Show PE /Cft
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
				<td><?php echo nl2br($service_portofdest_agent_charge); ?></td></tr><tr>
			<?php } ?>
			<?php if ($service_portofdest_agent_personal) { ?>	
				<td>DIRECT CONSIGNMENT: <?php echo nl2br($service_portofdest_agent_personal); ?></td></tr><tr>
			<?php } ?>
			<?php if ($service_portofdest_agent_forward) { ?>	
				<td>COLOAD/FREIGHT FORWARDER: <?php echo nl2br($service_portofdest_agent_forward); ?></td></tr><tr>
			<?php } ?>
			    </tr>
				
				</table>	
				 </div><!--"booking-content" -->
				
			</div><!-- end "rates-booking" -->

   
   
        </div><!-- end tab-->
     
        

   <?php if ($pickup == "true") { ?> 
   		<div id="tab-trucking"  >
		<div id="trucking_hidden" >
  	<?php } else { ?>
		<div id="tab-trucking"  style="display:none;">
		<div id="trucking_hidden" style="display:none;">
	<?php } ?>   		
		
		
			<div class ="trucking-trucker">
      				<div class="booking-heading"><?php echo $text_trucking_trucker; ?></div>
				<div class="booking-content">
				              	
              	<table class = "box">
              	
              	<tr>
              	<td>
              	<a href=""><?php echo $entry_truckingtrucker; ?></a><span class="help">	click for <a TARGET="_blank" href="<?php echo $tt_shipper_contact ;?>" >Tech-Tip</a></span>
				
				</td></tr>
		
              	<tr>
              		
              		<td><textarea name="entry_truckingpickup"cols="34" row="3" ><?php echo $truckingpickup;?></textarea></td>
              	</tr>
              	
              	</table>
				<table class = "box">
				
				<tr><td>Shipment ID</td><td><input type="text" placeholder="Shipment ID" id="truckingshipid" name="truckingshipid" value="<?php echo $truckingshipid;?>"	 size="20" /></td></tr> 			 
				 <tr><td>Density:</td><td><input type="text" placeholder="PCF (Density)" id="truckingpcf"  name="truckingpcf" value="<?php echo $truckingpcf;?>" size="20" /></td></tr>
				 <tr><td>Time / Distance:</td><td><input type="text" placeholder="Days" size="5" id="truckingdays" name="truckingdays" value="<?php echo $truckingdays;?>">  <input type="text" placeholder="Miles" size="7" value="<?php echo $cts_miles;?>"></td></tr>
              	 		
    	 		<tr>
              		<td>Cost Rate/CWT:</td> 
              		<td><input type="text" placeholder="Rate" id="truckingrate" name="truckingrate" value="<?php echo $truckingrate;?>" size="20" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckingminimum; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckingminimum;?>" name="truckingrate_min" value="<?php echo $truckingrate_min;?>" size="20" /></td>
              	</tr>
              	<tr>
              		<td>Fuel Surcharge %</td> 
              		<td><input type="text" placeholder="Fuel Surcharge %" name="entry_truckingfuel" value="" size="20" /></td>
              	</tr>
              	
              	<tr>
              		<td><?php echo $entry_truckercontact; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckercontact;?>" id="truckercontact" name="truckercontact" value="<?php echo $truckercontact;?>" size="20" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckertelephone; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckertelephone;?>"  id="truckertelephone" name="truckertelephone" value="<?php echo $truckertelephone;?>" size="20" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckerfax; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckerfax;?>"  id="truckerfax" name="truckerfax" value="<?php echo $truckerfax;?>" size="20" /></td>
              	</tr>
              	<tr>
              		<td><?php echo $entry_truckingemail; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_truckingemail;?>" id="truckingemail" name="truckingemail" value="<?php echo $truckingemail;?>" size="20" /></td>
              	</tr>
              	</table>
              	
				</div><!--"booking-content" -->
			
				
			
			</div><!-- end "trucking-trucker" -->
	<div class ="trucking-pickup">
      				<div class="booking-heading">Contact Details</div>
			<div class="booking-content">
          		
          		
    	 		<table class = "box">
    	 		<tr><td>Shipper:</td><td><i><input placeholder="Company Name" id="pickupShipper" name="pickupShipper" size="35" value="<?php echo $pickupShipper;?>" /></i></td></tr>
				<tr><td>Street Address:</td><td><input placeholder="Street Address" id="pickupAddress" name ="pickupAddress" size="35" value="<?php echo $pickupAddress;?>" /></td></tr>
				<tr><td></td><td><?php if($service_por){echo $service_por;} ?> <?php echo $service_zip;?></td></tr>
    	 		<tr>
              		<td><?php echo $entry_pickupcontact; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickupcontact;?>" id="pickupcontact" name="pickupcontact" value="<?php echo $pickupcontact;?>" size="20" /></td>
              	</tr>
              	
              	<tr>
              		<td><?php echo $entry_pickuptelephone; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickuptelephone;?>" id="pickuptelephone"  name="pickuptelephone" value="<?php echo $pickuptelephone;?>" size="20" /></td>
              	</tr>
    	 		<tr>
              		<td><?php echo $entry_pickupfax; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickupfax;?>" id="pickupfax" name="pickupfax" value="<?php echo $pickupfax;?>" size="20" /></td>
              	</tr>
              	
              	<tr>
              		<td><?php echo $entry_pickupemail; ?></td> 
              		<td><input type="text" placeholder="<?php echo $entry_pickupemail;?>" id="pickupemail" name="pickupemail" value="<?php echo $pickupemail;?>" size="20" /></td>
              	</tr>
              	
              	<tr>
              	
              		<td><?php echo $entry_pickupreadydate; ?></td> 
              		<td><input type="date"  name="readydate" id="readydate" value="<?php echo $readydate; ?>" size="11" />	
              	</tr>
               
            	 <tr>
            	 <td>Instructions for Trucking:</td>
            	<td>
            	<textarea placeholder="Instructions for Trucking"  id="bkpuspecinst"  name="bkpuspecinst" rows="4" cols="30"><?php echo $bkpuspecinst; ?></textarea>
            	</td>
            	</tr>
            	<tr>
              		<td>Receiving Hours:</td> 
              		<td><input type="text" placeholder="Receiving Hours " size="35" id="pickupReceivingHrs" name="pickupReceivingHrs" value="<?php echo $pickupReceivingHrs;?>" /></td>
              	</tr>
            	
              	</table>
              	
              	
    	 		
    	 		</div>
      			
      			<br>
			<div class="booking-content">
          		
          		
    	 		
    	 		<table class = "box" >
    	 		<tbody  > 
    	 		<tr><td>
    	 			<table>
    	 			
    	 			<tr><td colspan ="2" class= "underline">Calculated Sell Values</td></tr>
    	 			<tr><td>Rate/CWT</td><td><?php echo $rates_precarriage; ?></td></tr>
    	 			<tr><td>Minimum</td><td><?php echo $rates_precarriage_min; ?></td></tr>
    	 			
    	 			
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
    	 		</div>
        	</div><!--"booking-content" -->
     	
		</div><!-- end "trucking-pickup" -->		
		
	
		
		
			
			<div class ="trucking-carrier">
      				<div class="booking-heading">CTS - Trucking Carrier</div>
				<div class="booking-content">
				<table><tr><td><a onclick="displayTruckCarrier()">Profit Maintenance</a></td><tr></table>
				<table><tr><td>
				
				<table>
              			<?php if ($pickuppresidentialpu == "true") { ?>
              			<tr><td><input type="checkbox" id = "pickuppresidentialpu" name = "pickuppresidentialpu" checked="checked" value="<?php echo $pickuppresidentialpu; ?>">Resident PU</td></tr>
			  			<?php } else { ?>
			  			<tr><td><input type="checkbox" id = "pickuppresidentialpu" name = "pickuppresidentialpu" value="<?php echo $pickuppresidentialpu; ?>">Resident PU</td></tr>
			  			<?php } ?>
			  			
			  			<?php if ($pickupliftgate == "true") { ?>
			  			<tr><td><input type="checkbox" id = "pickupliftgate" name = "pickupliftgate" checked="checked" value="<?php echo $pickupliftgate; ?>"><?php echo $entry_pickupliftgate; ?></td></tr>
			  			<?php } else { ?>
			  			<tr><td><input type="checkbox" id = "pickupliftgate" name = "pickupliftgate" value="<?php echo $pickupliftgate; ?>"><?php echo $entry_pickupliftgate; ?></td></tr>
			  			<?php } ?>
			  			
			  			<?php if ($pickupexcesslen == "true") { ?>
			  			<tr><td><input type="checkbox" id = "pickupexcesslen" name = "pickupexcesslen" checked="checked" value="<?php echo $pickupexcesslen; ?>">Excess Len</td></tr>
			  			<?php } else { ?>
			  			<tr><td><input type="checkbox" id = "pickupexcesslen" name = "pickupexcesslen" value="<?php echo $pickupexcesslen; ?>">Excess Len</td></tr>
			  			<?php } ?>
			  			
			  			<?php if ($pickupappt == "true") { ?>
			  			<tr><td><input type="checkbox" id = "pickupappt" name = "pickupappt" checked="checked"  value="<?php echo $pickupappt; ?>"><?php echo $entry_pickupappt; ?></td></tr>
            			<?php } else { ?>
            			<tr><td><input type="checkbox" id = "pickupappt" name = "pickupappt" value="<?php echo $pickupappt; ?>"><?php echo $entry_pickupappt; ?></td></tr>
            			<?php } ?>
            			
				</table>
				<br>
				<br>
				<table>
					<tbody id="carrier_hidden" name ="carrier_hidden"  class = "carrier_hidden" style="display:none"> 
						<tr><td>Min Profit </td><td><input type="text" placeholder="Min Profit" id="truckingrate_min_profit" name="truckingrate_min_profit" value="<?php echo $truckingrate_min_profit; ?>" size="5" /></td></tr>
						<tr><td>Markup %</td><td><input type="text" placeholder="Markup%" name="truckingrate_markup" value="<?php echo $truckingrate_markup; ?>" size="5" /> </td></tr>
						<tr><td>Max Profit</td><td><input type="text" placeholder="Max Profit" name="truckingrate_max_profit" value="<?php echo $truckingrate_max_profit; ?>" size="5" /> </td></tr>
						<tr><td>Pers Eff Profit</td><td><input type="text" placeholder="Pers Eff Profit" name="truckingrate_per_effect" value="<?php echo $truckingrate_PE_profit; ?>" size="5" /> </td>	</tr>
						
					</tbody>
				</table>
				</td>
					
				<?php if ($carrier_info) { 
					echo "<td>";
					
					echo "<table bgcolor='#FFFFFF' >";	
					echo "<tr bgcolor='#F5F5DC' border ='0'><td>SCAC</td><td>Name</td><td>TT</td><td>Amount</td></tr>";				
					for ($row = 0; $row < $CTS_carriers; $row++)
									
					{	
					echo "<tr>";
										
					echo "<td> ".$carrier_info[$row]["scac"]."</td><td><a href='index.php?route=service/quotations/updateTrucking&token=";
					echo "".$token."&truckingnumber=".($row)."'> ".$carrier_info[$row]["name"]."</a></td><td>".$carrier_info[$row]["days"]."</td><td>$".$carrier_info[$row]["finalcharge"]."</td>";
					echo "<tr/>";
					}
						
					echo "</table>";
					echo "</td>";				
				}else{ ?>	
				<td>
					<textarea style='text-align:left;' name="" rows="7" cols="50" placeholder="Use CTS Truckers button to retieve a list of Carriers!" /></textarea>
				</td>	
				<?php } ?>
				
				</tr>
				</table>
					
    	 		
    	 		
				
			
			
			</div><!--"booking-content" -->
			
		
			
			
				</div><!-- end "trucking-carrier" -->
			</div><!-- end trucking_hidden-->
		</div><!-- end tab-->
		
        <div id="tab_booking_cost">
        	<div class ="costs-debit">
      				<div class="booking-heading"><?php echo $text_debit; ?></div>
				<div class="booking-content">
        
          <table class="box">
          
            <tr>
              <td><?php echo $entry_rateitem; ?></td><td></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_precarriage; ?></td>
              <td><input disabled="true" class="txtDebit" type="text" placeholder="" name="truckingrate_min" value="<?php echo $truckingrate_min;?>" size="25" /></td>
            </tr>    
            <tr>
              <td><?php echo $entry_costs_insurance; ?></td>
              <td><input class="txtDebit" type="text" placeholder="" name="entry_insurance" value="<?php echo $costs_insurance;?>" size="25" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_inoutcharges; ?></td>
              <td><input class="txtDebit" type="text" placeholder="" name="entry_inoutcharges" value="<?php echo $costs_inoutcharges;?>" size="25" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_palletization; ?></td>
              <td><input class="txtDebit" type="text" placeholder="" name="entry_palletization" value="<?php echo $costs_palletization;?>" size="25" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_segregation; ?></td>
              <td><input class="txtDebit" type="text" placeholder="" name="entry_segregation" value="<?php echo $costs_segregation;?>" size="25" /></td>
            </tr>
            
            <tr>
            <td><input type="text" name="costs_other_text" value="<?php echo $costs_other_text;?>" size="25" /></td>
            <td><input class="txtDebit" type="text" name="costs_other" value="<?php echo $costs_other;?>" size="25" /></td>
            </tr>
            <tr>
            <td>&nbsp;</td><td>&nbsp;</td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_totaldebit; ?></td>
             <td class="total" align="left">$<span id="sumDebit">0</span></td>
            </tr>
            
            </table>
            
            </div><!--"booking-content" -->
			</div><!-- end "costs-debit" -->	
            
            
            
            <div class ="costs-credit">
      				<div class="booking-heading"><?php echo $text_credit; ?></div>
				<div class="booking-content">
        
          <table class="box">
          
           	<tr>
              <td><?php echo $entry_rateitem; ?></td><td></td><td></td><td><?php echo $entry_costs_quote; ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_oncarriage; ?></td>
              <td></td>
              <td><input disabled="true" type="text" placeholder="CURR" name="QtFCurr"  id="QtFCurr" value="<?php echo $QtFCurr; ?>" size="5" /></td>
              <td><input disabled="true" class="txtCredit_quote" type="text" placeholder="" name="costs_oncarriage" id="costs_oncarriage" value="<?php echo $costs_oncarriage; ?>" size="10" /></td>
            </tr>
            <tr>
              <td><input disabled="true" type="text" placeholder="" name="entry_other2" value="<?php echo $entry_other2; ?>" size="20" /></td>
              <td><?php echo $entry_rates_flat; ?></td>
              <td></td>
              <td><input disabled="true" class="txtCredit_quote" type="text" placeholder="" name="costs_desc2cost" value="<?php echo $costs_desc2cost; ?>" size="10" /></td>
            </tr>
            <tr>
              <td><input disabled="true"type="text" placeholder="" name="entry_other4" value="<?php echo $entry_other4; ?>" size="20" /></td>
              <td><?php echo $entry_rates_wm; ?></td>
              <td></td>
              <td><input disabled="true" class="txtCredit_quote" type="text" placeholder="" name="costs_desc3cost" value="<?php echo $costs_desc3cost; ?>" size="10" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_thc2; ?></td>
              <td colspan="2"><i>$<?php echo $qtthccostr; ?> w/m, $<?php echo $qtthccostm; ?> min</i></td>
              
              <td><input disabled="true" class="txtCredit_quote" type="text" placeholder="" id="cost_thc_amount" name="cost_thc_amount" value="<?php echo $cost_thc_amount; ?>" size="10" /></td>
            </tr>
            
            <tr>
              <td><?php echo $entry_costs_destdocs; ?></td>
              <td><?php echo $entry_rates_flat; ?></td>
              <td></td>
              <td><input disabled="true" class="txtCredit_quote" type="text" placeholder="" name="costs_destdocs" value="<?php echo $costs_destdocs; ?>" size="10" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_destcharges; ?></td>
              <td><?php echo $entry_rates_flat; ?></td>
              <td><input disabled="true" type="text" placeholder="" name="costs_destcharges_text" value="<?php echo $costs_destcharges_text; ?>" size="20" /></td>
              <td><input disabled="true" class="txtCredit_quote" type="text" placeholder="" name="costs_destcharges" value="<?php echo $costs_destcharges; ?>" size="10" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_customsclearance; ?></td>
              <td></td>
              <td></td>
              <td><input disabled="true" class="txtCredit_quote" type="text" placeholder="" name="costs_customsclearance" value="<?php echo $costs_customsclearance; ?>" size="10" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_costs_totalcredit; ?></td>
              <td></td>
              <td></td>
              <td class="total" align="right" >$<span id="sumCredit_quote">0</span></td>
            </tr>
            </table>
            </div><!--"booking-content" -->
			</div><!-- end "costs-credit" -->
		
		<div class ="costs-hazardous">
      				<div class="booking-heading"><?php echo $text_hazardous; ?></div>
				<div class="booking-content">
			
			<table class="box">
          
           	<tr>
           	<td><?php echo $entry_rate; ?></td>
           	<td><input type="text" placeholder="" name="rates_hazsurcharge_cost" id="rates_hazsurcharge_cost" value="<?php echo $rates_hazsurcharge_cost; ?>" size="10" /></td>
           	<td><?php echo $entry_costs_minimum; ?></td>
           	<td><input type="text" placeholder="" name="rates_hazsurcharge_cost_min" id="rates_hazsurcharge_cost_min" value="<?php echo $rates_hazsurcharge_cost_min; ?>" size="10" /></td>
			</tr>
            </table>
				
		</div><!--"booking-content" -->
			</div><!-- end "costs-hazardous" -->
		
		<div class ="costs-profit">
      				<div class="booking-heading"><?php echo $text_profitshare; ?></div>
				<div class="booking-content">
			<table class="box">
          
           	<tr>
           	<td><?php echo $entry_costs_profitsharedue; ?></td><td>&nbsp;</td><td>&nbsp;</td>
           	<td><input type="text" placeholder="" name="entry_profitsharedue" value="" size="10" /></td>
           	</tr>
            </table>
		</div><!--"booking-content" -->
			</div><!-- end "costs-profit" -->
			
        </div><!-- end tab-->
        
        
        <div id="tab-hazardous">
        	<div class ="hazardous-item">
        	<div class="booking-heading"><?php echo $text_hazarditem; ?></div>
        	<div class="booking-content">
          	<table class="form">
            
            <tr>
              
            </tr>
            <tr>
              
            </tr>         
            </table>
            
            
            </div><!--"booking-content" -->
            </div><!-- end "hazardous-item" -->
            
            <div class ="hazardous-detail">
            <div class="booking-heading"><?php echo $text_hazardousdetail; ?></div>
            <div class="booking-content">
            
          	<table class="form">
            
            <tr>
              
            </tr>
            <tr>
              
            </tr>         
            </table>
            
            
            </div><!--"booking-content" -->
            </div><!-- end "hazardous-detail" -->
            
            <div class ="hazardous-rates">
            <div class="booking-heading"><?php echo $text_hazardousrates; ?></div>
            <div class="booking-content">
          	<table class="form">
            
            <tr>
              
            </tr>
            <tr>
              
            </tr>         
            </table>
            
            
            </div><!--"booking-content" -->
            </div><!-- end "hazardous-rates" -->
            
            <div class ="hazardous-booking">
            <div class="booking-heading"><?php echo $text_hazardousbookinginfo; ?></div>
            <div class="booking-content">
          	<table class="form">
            
            <tr>
              
            </tr>
            <tr>
              
            </tr>         
            </table>
            
            
            </div><!--"booking-content" -->
            </div><!-- end "hazardous-booking" -->
            
            <div class ="hazardous-hazardous">
            <div class="booking-heading"><?php echo $text_hazardousid; ?></div>
            <div class="booking-content">
          	<table class="form">
            
            <tr>
              
            </tr>
            <tr>
              
            </tr>         
            </table>
            
            
            </div><!--"booking-content" -->
            </div><!-- end "hazardous-hazardous" -->
            
            <div class ="hazardous-package">
            <div class="booking-heading"><?php echo $text_hazardouspackage; ?></div>
            <div class="booking-content">
          	<table class="form">
            <tr>
              <td></td>
            </tr>         
            </table>
            </div><!--"booking-content" -->
            </div><!-- end "hazardous-package" -->
            
            
        </div><!-- end tab-->
        
         <div id="tab-notes">
          <div class ="booking-restrictions-detail">
          <div class="booking-heading"><?php echo $text_restriction_details; ?></div> 
          <div class="booking-content">
           
           
             <table class ="list" >
             <thead><tr><td align="center"> Operation Notes - <i>posted for customer review.</i></td></tr></thead>
             
             <?php if ($notes_ops_list) { ?>
             <tbody>
             <tr>
             <td>
             <input type="hidden" id="note" name="note" value="<?php echo $notes_ops_list; ?>" />
             </td>
             </tr>
             <?php foreach ($notes_ops_list as $note) { ?>
           <tr>
           <td colspan="10">
          	<span><?php echo  nl2br($note); ?></span>
           </td>
           </tr>
           
             	 <?php } ?>
           </tbody>  	 
            <?php } else { ?>
            <tbody>
            <tr>
              <td class="center" colspan="10">No Notes yet!</td>
            </tr>
            </tbody>
            <?php } ?>
            
             
             </table>
             
           <table>
           <tr valign="top">  
            <td width = "50%"><b>Notes</b>
            
           	 <?php if ($notes_system) {?> <br><?php echo $notes_system; ?>	 <?php } ?>
            
            <br>
            <?php echo nl2br($qtfree); ?>
            </td>
                  
           <td width = "50%" align="right">
           
           <b>-- Add to Operation notes here --</b><br>
             <textarea type="text" name="notes_ops_add" id="notes_ops_add" cols="70" rows="5" ><?php echo $notes_ops_add; ?></textarea>
             <br> <a href="<?php echo $updateNotes; ?>" class="button" >Add Note</a>
             </td>
             </tr>
            
            </table> 
            </div><!--"booking-content" -->
            </div><!-- end "booking-notes-operational"-->
            
        </div><!-- end tab-->
        
        
        <div id="tab-restrictions">
          <div class ="booking-restrictions-detail">
          <div class="booking-heading"><?php echo $text_restriction_details; ?>/Clauses</div> 
          <div class="booking-content">
          <table class="form">
            
            <tr><td><?php echo nl2br($qtfree); ?></td></tr>
            <tr>
              
            </tr>         
            </table>
            </div><!--"booking-content" -->
            </div><!-- end "booking-notes-operational"-->
            
        </div><!-- end tab-->
        
        
      
        
        <div id="tab-history">
          <?php if ($error_warning) { ?>
			<div class="warning"><?php echo $error_warning; ?></div>
			<?php } ?>
			<?php if ($success_track) { ?>
			<div class="success"><?php echo $success_track; ?></div>
			<?php } ?>
			
			<table class="list">
			  <thead>
			    <tr>
			      <td class="left"><?php echo $column_date_added; ?></td>
			      <td class="center">By</td>
			      <td class="left"><?php echo $column_comment; ?></td>
			    </tr>
			  </thead>
			  <tbody>
			    <?php if ($histories) { ?>
			    <?php foreach ($histories as $history) { ?>
			    <tr>
			      <td class="left"><?php echo $history['date_added']; ?></td>
			      <td class="center"><?php echo $history['user']; ?></td>
			      <td class="left"><?php echo $history['comment']; ?></td>
			    </tr>
			    <?php } ?>
			    <?php } else { ?>
			    <tr>
			      <td class="center" colspan="3"><?php echo $text_no_results; ?></td>
			    </tr>
			    <?php } ?>
			  </tbody>
			</table>
			
			<div class="pagination"><?php echo $pagination; ?></div>
          <table class="form">
            <tr>
              <td>Tracking Item:</td>
              <td><textarea name="comment" cols="40" rows="8" style="width: 99%;"></textarea></td>
            </tr>
            <tr>
              <td colspan="3" style="text-align: right;"><a id="button-history" class="button"><span>Add Item</span></a></td>
            </tr>
          </table>
        </div>   
         
      </form>
      </div>
      </div>
    </div>
  </div><!-- end content -->
<!--[if IE]>
<script type="text/javascript" src="view/javascript/jquery/flot/excanvas.js"></script>
<![endif]--> 
<script type="text/javascript"><!-- adds placeholder for x-browser support, removes before submit form.
	$('[placeholder]').focus(function() {
  var input = $(this);
  if (input.val() == input.attr('placeholder')) {
    input.val('');
    input.removeClass('placeholder');
  }
	}).blur(function() {
  var input = $(this);
  if (input.val() == '' || input.val() == input.attr('placeholder')) {
    input.addClass('placeholder');
    input.val(input.attr('placeholder'));
  }
	}).blur();
	
	$('[placeholder]').parents('form').submit(function() {
  $(this).find('[placeholder]').each(function() {
    var input = $(this);
    if (input.val() == input.attr('placeholder')) {
      input.val('');
    }
  })
});
		
//--></script>
<script type="text/javascript"><!--
    function showHide() {
    	if(document.getElementById("hazardous").checked)	{
   		 document.getElementById("hazardous_hidden").style.display = ""
   		 document.getElementById("hazardous_tab").style.display = ""; 
   			}
    	else {
    	 document.getElementById("hazardous_hidden").style.display = "none"
    	 document.getElementById("hazardous_tab").style.display = "none"; 
    	 	}
    	 	
    	if(document.getElementById("pickup").checked)	{
    	 document.getElementById("readydate_hidden").style.display = ""
    	 document.getElementById("pickup_hidden").style.display = ""
    	 document.getElementById("trucking_hidden").style.display = ""
   		 document.getElementById("tab-trucking").style.display = ""
   		 document.getElementById("trucking_tab").style.display = ""; 
   			}
    	else {
    	document.getElementById("readydate_hidden").style.display = "none"
    	 document.getElementById("pickup_hidden").style.display = "none"
    	  document.getElementById("trucking_hidden").style.display = "none"
    	 document.getElementById("tab-trucking").style.display = "none"
    	 document.getElementById("trucking_tab").style.display = "none";	
    	 	} 	
    	    	 
    	 if(document.getElementById("doormove").checked)	{ 
    	 document.getElementById("doormove_hidden").style.display = "";
    	 	}
    	 else { 
    	 	document.getElementById("doormove_hidden").style.display = "none";	
    	 	} 	
    	 
    	 if(document.getElementById("routedcargo_display").checked)	{ 
    	 document.getElementById("routedcargo_hidden").style.display = "";
    	   }
    	 else { 
    	    document.getElementById("routedcargo_hidden").style.display = "none";	
    	 	}
    	 	
    	 if(document.getElementById("forward").checked)	{ 
    	 document.getElementById("brokerage_hidden").style.display = "";
    	   }
    	 else { 
    	    document.getElementById("brokerage_hidden").style.display = "none";	
    	 	}	
 	 	
    	     	 	
   	 } 
//--></script>

<?php if ($no_personaleffects=='true') { ?>
	<script type="text/javascript"><!--
	document.getElementById("personaleffects").disabled=true;
	//--></script>
<?php }else { ?>
	<script type="text/javascript"><!--
	document.getElementById("personaleffects").removeAttr("disabled");
	//--></script>
<?php } ?>

<script type="text/javascript"><!--
	
  function sumItUp() 
	{var sum = 0;
    
    //iterate through each textboxes and add the values
    $(".amount").each(function() {

    //add only if the value is number
    if(!isNaN(this.value) && this.value.length!=0) {
       sum += parseFloat(this.value);}

   	});
    
    $("#sumFin").html(sum.toFixed(2));
	
	}

	$('.amount').live("change", function() {

    sumItUp();

	});
	//	<input type="text" name="amount[]" class=".amount" />
</script>

<script type="text/javascript">$("input[name='Bkcold']").change(function(){	
	var Bkcold =$("#Bkcold:checked").val();
	var personaleffects = 'false'
		if (document.getElementById("personaleffects").checked){
			var Bkcold ='S'
			var personaleffects = 'true'
		}
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'personaleffects', 'value':personaleffects});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'Bkcold', 'value':Bkcold});});
</script>

<script type="text/javascript">$("input[name='commodity_measure']").on('change',function(e){	
	var commodity_measure = $("#commodity_measure:checked").val();
	if(commodity_measure = 'M'){
		$("#commodity_lbs").prop('disabled', true);
		$("#commodity_cft").prop('disabled', true);
		$("#commodity_kg").prop('disabled', false);
		$("#commodity_cbm").prop('disabled', false);
		
	}else {
		$("#commodity_lbs").prop('disabled', false);
		$("#commodity_cft").prop('disabled', false);
		$("#commodity_kg").prop('disabled', true);
		$("#commodity_cbm").prop('disabled', true);
		
	};
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_measure', 'value':commodity_measure});});
</script>
<script type="text/javascript">
	$('.clickable td').live('change',function(e) {
	var regexp=/\D/g;
	var commodity_pieces = $("input[name='commodity_pieces']").val();
	var commodity_lbs = $("input[name='commodity_lbs']").val();var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_cft = $("input[name='commodity_cft']").val();var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_lbs2 = new String(commodity_lbs);var commodity_lbs3 = Number(commodity_lbs2.replace(/[^0-9\.]+/g,""));
	var commodity_kg2 = new String(commodity_kg);var commodity_kg3 = Number(commodity_kg2.replace(/[^0-9\.]+/g,""));
	var commodity_cft2 = new String(commodity_cft);var commodity_cft3 = Number(commodity_cft2.replace(/[^0-9\.]+/g,""));
	var commodity_cbm2 = new String(commodity_cbm);var commodity_cbm3 = Number(commodity_cbm2.replace(/[^0-9\.]+/g,""));

	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_pieces', 'value':commodity_pieces});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_lbs', 'value':commodity_lbs3.toFixed(0)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_kg', 'value':commodity_kg3});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'weight', 'value':commodity_kg3});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_cft', 'value':commodity_cft3.toFixed(0)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_cbm', 'value':commodity_cbm3});
 	 });
</script>
<script type="text/javascript">
$(document).ready(function() {
	var commodity_lbs = parseFloat($("input[name='commodity_lbs']").val());
	var commodity_cft = parseFloat($("input[name='commodity_cft']").val());
	var commodity_kg = parseFloat($("input[name='commodity_kg']").val());
	var commodity_cbm = parseFloat($("input[name='commodity_cbm']").val());
	
	$('input[name=\'commodity_lbs\']').val(commodity_lbs.toFixed(0));
	$('input[name=\'commodity_cft\']').val(commodity_cft.toFixed(0));
	$('input[name=\'commodity_kg\']').val(commodity_kg.toFixed(1));
	$('input[name=\'commodity_cbm\']').val(commodity_cbm.toFixed(3));
	

	
});
</script>
<script type="text/javascript"><!--
$('input[name=\'service_vessel\']').autocomplete({
	delay: 100,
	source: function(request, response) {
			
		$.ajax({
			url: 'index.php?route=service/booking/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'vessel_id':  0,
					'name':    ' Vessel Name ',
					'cargocut':' Cargo Cut  ',
					'aescut':  '  AES Cut   ',
					'saildate':'  Sailing   ',
					'voyage':' Voyage ',
					'SCAC':' SCAC ',
					'eta':' ETA @ POD '
				});
				
				response($.map(json, function(item) {
					return {
					    
						label: item.cargocut + ' | ' + item.aescut +' | ' + item.saildate + ' | ' + item.name + ' | ' + item.voyage + ' | ' +item.SCAC + ' | ' + item.eta,
						label2: item.name+'/'+item.voyage,
						label3: item.cargocut,
						label4:item.aescut,
						label5:item.saildate,
						label6:item.eta,
						label7:item.name,
						value: item.vessel_id
						
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'service_vessel\']').val(ui.item.label2);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_vessel', 'value':(ui.item.label7)});
		$('input[name=\'vessel_id\']').val(ui.item.value);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'vessel_id', 'value':(ui.item.value)});
		$('input[name=\'idd\']').val(ui.item.label3);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'idd', 'value':(ui.item.label3)});
		$('input[name=\'service_ldt\']').val(ui.item.label3);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_ldt', 'value':(ui.item.label3)});
		//$('input[name=\'service_onboarddate\']').val(ui.item.label4);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_onboarddate', 'value':(ui.item.label4)});
		$('input[name=\'service_etd\']').val(ui.item.label5);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_etd', 'value':(ui.item.label5)});
		$('input[name=\'service_eta\']').val(ui.item.label6);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_eta', 'value':(ui.item.label6)});
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 
<script type="text/javascript"><!--
	$('input[name=\'service_portofloading\']').autocomplete({
	delay: 500,	
	source: function(request, response) {
		$.ajax({url: 'index.php?route=service/booking/getPortofLoading&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.service_portofloading,value: item.service_portofloading_code}}));}});},
	select: function(event, ui) {$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofloading', 'value':(ui.item.label)});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofloading_code', 'value':(ui.item.value)});
		$('input[name=\'service_portofloading\']').val(ui.item.label);
		$('input[name=\'service_portofloading_code\']').val(ui.item.value);
		$.post('index.php?route=service/quotations/updateWarehouse&token=<?php echo $token; ?>');
		return false;},
	focus: function(event, ui) {return false;}});//-->
</script> 
	
<script type="text/javascript"><!--
$('input[name=\'service_portofdest\']').autocomplete({
	delay: 100,
	source: function(request, response) {		
		$.ajax({url: 'index.php?route=service/booking/getPortofDest&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',success: function(json) {
			response($.map(json, function(item) {
				return {
					label: item.service_portofdest,
					value: item.service_portofdest_code}}));
			}
		});
	},
	select: function(event, ui) {
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest', 'value':(ui.item.label)});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_code', 'value':(ui.item.value)});
		$('input[name=\'service_portofdest\']').val(ui.item.label);
		$('input[name=\'service_portofdest_code\']').val(ui.item.value);
		$.post('index.php?route=service/quotations/updateService&token=<?php echo $token; ?>');
		
		return false;
	},
	
	focus: function(event, ui) {
		return false;
	}
});
//--></script>
<script type="text/javascript"><!-- History 
$('#history .pagination a').live('click', function() {
	$('#history').load(this.href);
	
	return false;
});			

$('#history').load('index.php?route=service/quotations/getHistory&token=<?php echo $token; ?>&quote_no=<?php echo $quote_no; ?>');

$('#button-history').bind('click', function() {
	$.ajax({
		url: 'index.php?route=service/quotations/getHistory&token=<?php echo $token; ?>&quote_no=<?php echo $quote_no; ?>',
		type: 'post',
		dataType: 'html',
		data: 'comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-history').attr('disabled', true);
			$('#history').before('<div class="attention"><img src="view/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-history').attr('disabled', false);
			$('.attention').remove();
      		$('#tab-history textarea[name=\'comment\']').val('');
      		location.reload();
		},
		success: function(html) {
			$('#history').html(html);
			
			$('#tab-history input[name=\'comment\']').val('');
		}
	});
});
</script>
<script type="text/javascript"><!-- Customer Name Auto Complete	


	$('input[name=\'customerName\']').autocomplete({
		
		
		
	delay: 10,
	source: function(request, response) {
		$.ajax({url: 'index.php?route=maintenance/customer_search/getBookingCustomer&token=<?php echo $token; ?>&filter_custkey=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.CustName1 + ' | ' + item.CustStreet +' | ' + item.CustState + ' | ' + item.CustZip,
						label2: item.custkey,
						label3: item.CustStreet,
						label4: item.CustCity,
						label5: item.CustState,
						label6: item.CustZip,
						value: item.CustCode,
						value2: item.CustLastR,
						value3: item.custuserouted,
						value4: item.custtelephone,
						value5: item.CustName1,
						value6: item.CustName2,
						value7: item.custff,
						value8: 'index.php?route=service/quotations/updateCustomer&token=<?php echo $token; ?>&customer_id='+item.CustCode,
						
							}}));}});},	
				select: function(event, ui) {

					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerName','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress1','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress2','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerCity','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerState','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerZip','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'CustLastR','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'routedcargo','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custtelephone','value':''});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custff','value':''});
					
					$('textarea[name=\'customerdetail\']').val('');
					$('input[name=\'customerName\']').val('');
					$('input[name=\'customerAddress1\']').val('');
					$('input[name=\'customerAddress2\']').val('');
					$('input[name=\'customerCity\']').val('');
					$('input[name=\'customerState\']').val('');
					$('input[name=\'customerZip\']').val('');
					$('input[name=\'custtelephone\']').val('');
					
					
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail','value':((ui.item.value5)+'\n'+(ui.item.label3)+'\n'+(ui.item.label4)+','+(ui.item.label5)+' '+(ui.item.label6))});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerName', 'value':(ui.item.value5)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress1', 'value':(ui.item.label3)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerCity', 'value':(ui.item.label4)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerState', 'value':(ui.item.label5)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerZip', 'value':(ui.item.label6)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer', 'value':(ui.item.value)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'CustLastR', 'value':(ui.item.value2)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'routedcargo','value':(ui.item.value3)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custtelephone','value':(ui.item.value4)});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custff','value':(ui.item.value7)});
					
					$('textarea[name=\'customerdetail\']').val((ui.item.value5)+'\n'+(ui.item.label3)+'\n'+(ui.item.label4)+','+(ui.item.label5)+' '+(ui.item.label6));
					
					$('input[name=\'customerName\']').val(ui.item.value5);
					$('input[name=\'customerAddress1\']').val(ui.item.label3);
					$('input[name=\'customerCity\']').val(ui.item.label4);
					$('input[name=\'customerState\']').val(ui.item.label5);
					$('input[name=\'customerZip\']').val(ui.item.label6);
					$('input[name=\'custtelephone\']').val(ui.item.value4);
				
					
					if (ui.item.value6){
						
						$('input[name=\'customerAddress1\']').val(ui.item.value6);
						$('input[name=\'customerAddress2\']').val(ui.item.label3);
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail','value':((ui.item.value5)+'\n'+(ui.item.value6)+'\n'+(ui.item.label3)+'\n'+(ui.item.label4)+','+(ui.item.label5)+' '+(ui.item.label6))});
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress1', 'value':(ui.item.value6)});
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress2', 'value':(ui.item.label3)});
						
					}
					
					$.post(ui.item.value8);
					
					return false;},
				
				focus: function(event, ui) {return false;}
				});
		
</script>
<script type="text/javascript"><!-- Quote to use
	$('input[name=\'quotenumber\']').autocomplete({
		delay: 500,
		source: function(request, response) {
			$.ajax({url: 'index.php?route=service/quotations/getQuotation&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
					label: item.quotenumber+' Customer:'+item.quotecustomer+' Created:'+ item.quotedate,
					value: item.quotenumber,
					value1: item.quotedate,
					value2: item.quotecustomer,
					value3: item.customername,
					value4: item.quotecontact,
					value5: item.quotephone,
					value6: item.quotefax,
					value7: item.quoteemail,
					value8: item.customernumber,
					value9: 'index.php?route=service/quotations/update&token=<?php echo $token; ?>&quote_no='+item.quotenumber
					
					}}));}});},
			select: function(event, ui) {
				$(event.target).val(ui.item.label);
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'quotenumber',  'value':(ui.item.value)});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail',  'value':(ui.item.value2)});
				$('input[name=\'quotenumber\']').val(ui.item.value);
				$('input[name=\'customerdetail\']').val(ui.item.value2);
				window.location.href =ui.item.value9;
				//$.post('index.php?route=service/quotations/previous&token=<?php echo $token; ?>&quote_no=' +  encodeURIComponent(item.value));
				return false;},
			focus: function(event, ui) {return false;}});//-->
</script>
<script type="text/javascript"><!-- Customer Contact
var email_to_send = [];	

$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});

$('input[name=\'customercontact\']').catcomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({url: 'index.php?route=maintenance/customer/autocomplete_contact&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {response($.map(json, function(item) {return {
					category: item.customer_group,
					label: item.name + ' | ' + item.email,
					label2: item.name,
					value: item.customer_id,
					value2:item.email}}));}});}, 
					
	select: function(event, ui) {
		
		
		$('#customer-email').append('<div id="customer-email' + ui.item.value + '">' + ui.item.label2 +' - '+ ui.item.value2 +'<img src="view/image/delete.png" alt="" /><input type="hidden" name="customer-email[]" value="' + ui.item.value + '" /></div>');
		$('#customer-email div:odd').attr('class', 'odd');
		$('#customer-email div:even').attr('class', 'even');
			
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customercontact', 'value':(ui.item.label2)});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer_email]['+ ui.item.value, 'value':( ui.item.value2)});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer_email', 'value':(ui.item.value2)});

		email_to_send.push(ui.item.value2);

		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'email_to_send', 'value':(email_to_send)});
		

	return false;	},
		
	focus: function(event, ui) {return false;}});

$('#customer-email div img').live('click', function() {
	$(this).parent().remove();
	
	$('#customer-email div:odd').attr('class', 'odd');
	$('#customer-email div:even').attr('class', 'even');	
});


//--></script>  
<script type="text/javascript"><!-- Agent Contact

$('input[name=\'agentemail\']').autocomplete({
	
	delay: 500,
	source: function(request, response) {
		$.ajax({url: 'index.php?route=maintenance/agents/autocomplete_agents&token=<?php echo $token; ?>&filter_name_agent=' +  encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {response($.map(json, function(item) {return {
					label: item.name + ' | ' + item.email,
					label2: item.name,
					value: item.affiliate_id,
					value2:item.email}}));}});}, 
					
	select: function(event, ui) {
		$('#agent-email' + ui.item.value).remove();
		$('#agent-email').append('<div id="agent-email' + ui.item.value + '">' + ui.item.label2 +' - '+ ui.item.value2 +'<img src="view/image/delete.png" alt="" /><input type="hidden" name="agent-email[]" value="' + ui.item.value + '" /></div>');
		$('#agent-email div:odd').attr('class', 'odd');
		$('#agent-email div:even').attr('class', 'even');
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'agentemail', 'value':(ui.item.label2)});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'agent_email]['+ ui.item.value, 'value':( ui.item.value2)});
		$('input[name=\'agentemail\']').val(ui.item.label2);
		
		//var agent_contact = agent_contact.push(ui.item.value);
		
		//$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'agent_contact', 'value':agent_contact});
		
		return false;	},
		
	focus: function(event, ui) {
      	return false;
   	}
});

$('#agent-email div img').live('click', function() {
	$(this).parent().remove();
	
	$('#agent-email div:odd').attr('class', 'odd');
	$('#agent-email div:even').attr('class', 'even');	
});
//--></script>

 
<!--/Sum fields/-->
<script type="text/javascript">$(document).ready(function() {var rates_oceanfreight = $("input[name=rates_oceanfreight]").val();
	var rates_oceanfreight_min = $("input[name=rates_oceanfreight_min]").val();	
	var rates_oceanfreight_min2 = parseFloat(rates_oceanfreight_min);
	var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
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

$("input[name=rates_docsreqd]").live('change',function() {
	var docsreqd = $("input[name=rates_docsreqd]").val();
	var rates_docsreqd = parseFloat(docsreqd)||0;
	var rates_docsreqd2 = rates_docsreqd.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_docsreqd_amount','value':rates_docsreqd2} );	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_docsreqd','value':rates_docsreqd2} );	
	$('input[name=\'rates_docsreqd\']').val(rates_docsreqd2); 
	$('input[name=\'rates_docsreqd_amount\']').val(rates_docsreqd2); 

	});
</script>

<script type="text/javascript">$(document).ready(function() {var rates_destcharges = $("input[name=rates_destcharges]").val();
var rates_destcharges_amount = parseFloat(rates_destcharges)||0;
var rates_destcharges_amount2 = rates_destcharges_amount.toFixed(2);
$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_destcharges_amount','value':rates_destcharges_amount2} );	
$('input[name=\'rates_destcharges_amount\']').val(rates_destcharges_amount2);});

$("input[name=rates_destcharges]").live('change',function() {
	var rates_destcharges = $("input[name=rates_destcharges]").val();
	var rates_destcharges_amount = parseFloat(rates_destcharges)||0;
	var rates_destcharges_amount2 = rates_destcharges_amount.toFixed(2);

	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_destcharges','value':rates_destcharges_amount2} );
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_destcharges_amount','value':rates_destcharges_amount2} );	
	$('input[name=\'rates_destcharges_amount\']').val(rates_destcharges_amount2); 
	$('input[name=\'rates_destcharges\']').val(rates_destcharges_amount2); 
	});
</script>

<script type="text/javascript">$(document).ready(function() {var bolfee_min = $("input[name=rates_bolfee_min]").val();
	var bolfee_sum = parseFloat(bolfee_min)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_bolfee_amount','value':bolfee_sum.toFixed(2)});
	$('input[name=\'rates_bolfee_amount\']').val(bolfee_sum.toFixed(2));}
	);
	
	$("input[name=rates_bolfee_min]").live('change',function() {
			var bolfee_min = $("input[name=rates_bolfee_min]").val();
			var bolfee_sum = parseFloat(bolfee_min)||0;
			$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_bolfee_amount','value':bolfee_sum.toFixed(2)} );
			$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_bolfee_min','value':bolfee_sum.toFixed(2)} );
			$('input[name=\'rates_bolfee_min\']').val(bolfee_sum.toFixed(2));
			$('input[name=\'rates_bolfee_amount\']').val(bolfee_sum.toFixed(2));}
	);
</script>
<script type="text/javascript">$(document).ready(function() {var eufilingfee_min = $("input[name=rates_eufilingfee_min]").val();
	var eufilingfee_sum = parseFloat(eufilingfee_min)||0;
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_eufilingfee_amount','value':eufilingfee_sum.toFixed(2)});
	$('input[name=\'rates_eufilingfee_amount\']').val(eufilingfee_sum.toFixed(2));});
	
	$("input[name=rates_eufilingfee_min]").live('change',function() {
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

	$("input[name=rates_oncarriage]").live('change',function(){
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
var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
var commodity_kg = $("input[name='commodity_kg']").val();
var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;
if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
var ocean_sum = commodity_wm * parseFloat(rates_thc)||0;
if (ocean_sum<rates_thc_min2){ocean_sum = rates_thc_min2};
var ocean_sum = ocean_sum.toFixed(2);	
$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_thc_amount','value':ocean_sum} );
$('input[name=\'rates_thc_amount\']').val(ocean_sum);	});
</script>	
<script type="text/javascript">$(document).ready(function() {var rates_hazardous = $("input[name=rates_hazardous]").val();
	var rates_hazardous_min = $("input[name=rates_hazardous_min]").val();
	var rates_hazardous_min2 = parseFloat(rates_hazardous_min);
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
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
	</script>	
<script type="text/javascript">$(document).ready(function() {var rates_precarriage = $("input[name=rates_precarriage]").val();
	var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();
	var rates_precarriage_min2 = parseFloat(rates_precarriage_min);	
	var regexp=/\D/g;var commodity_lbs = $("input[name='commodity_lbs']").val();	
	var commodity_lbs2 = Number(commodity_lbs.replace(/[^0-9\.]+/g,""));
	var commodity_lbs3 = parseFloat(commodity_lbs2 * 0.01);	
	var commodity_wm = commodity_lbs3;var rates_precarriage_sum = commodity_wm * parseFloat(rates_precarriage)||0;
	var rates_precarriage_sum = rates_precarriage_sum.toFixed(2);
	if (rates_precarriage_sum < rates_precarriage_min2){rates_precarriage_sum = rates_precarriage_min2};
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_precarriage_amount','value':rates_precarriage_sum} );
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_sum);});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_chassissurcharge = $("input[name=rates_chassissurcharge]").val();
	var rates_chassissurcharge_min = $("input[name=rates_chassissurcharge_min]").val();
	var rates_chassissurcharge_min2 = parseFloat(rates_chassissurcharge_min);
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(rates_chassissurcharge)||0;
	if (ocean_sum<rates_chassissurcharge_min2){ocean_sum = rates_chassissurcharge_min2};var ocean_sum = ocean_sum.toFixed(2);	
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
<script type="text/javascript">$(document).ready(function() {var rates_brokerage_percentage = $("input[name=rates_brokerage_percentage]").val();
	var ocean_freight = $("input[name=rates_oceanfreight_amount]").val();
	var rates_brokerage_total = (parseFloat(rates_brokerage_percentage)*parseFloat(ocean_freight)/100);	
	$('input[name=\'rates_brokerage_percentage_amount\']').val(rates_brokerage_total.toFixed(2));
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_amount', 'value':rates_brokerage_total});});

	$("input[name=rates_brokerage_percentage]").live('change',function(){
	var rates_brokerage_percentage = $("input[name=rates_brokerage_percentage]").val();
	var ocean_freight = $("input[name=rates_oceanfreight_amount]").val();
	var rates_brokerage_percentage_amount = (parseFloat(rates_brokerage_percentage)*parseFloat(ocean_freight)/100);	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage', 'value':rates_brokerage_percentage});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_amount', 'value':rates_brokerage_percentage_amount.toFixed(2)});
	$('input[name=\'rates_brokerage_percentage\']').val(rates_brokerage_percentage);
	$('input[name=\'rates_brokerage_percentage_amount\']').val(rates_brokerage_percentage_amount.toFixed(2));	
	});
</script>	
<script type="text/javascript">$(document).ready(function() {var rates_other2 = $("input[name=rates_other2]").val();
	var rates_other2_sum = parseFloat(rates_other2)||0;	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other2_amount','value':rates_other2_sum.toFixed(2)});
	$('input[name=\'rates_other2_amount\']').val(rates_other2_sum.toFixed(2));});
		
	$("input[name=rates_other2]").live('change',function(){	var rates_other2 = $("input[name=rates_other2]").val();
	
		var rates_other2_sum = parseFloat(rates_other2)||0;
		$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other2_amount','value':rates_other2_sum.toFixed(2)} 	);
		$('input[name=\'rates_other2\']').val(rates_other2_sum.toFixed(2));	
		
		$('input[name=\'rates_other2_amount\']').val(rates_other2_sum.toFixed(2));
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_other2', 'value':rates_other2_sum.toFixed(2)});
		});
</script>
<script type="text/javascript">$(document).ready(function() {var rates_other3 = $("input[name=rates_other3]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};var rates_other3_sum = commodity_wm * parseFloat(rates_other3)||0;$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other3_amount','value':rates_other3_sum.toFixed(2)} 	);$('input[name=\'rates_other3_amount\']').val(rates_other3_sum.toFixed(2));	});	</script>
<script type="text/javascript">$(document).ready(function() {var rates_other4 = $("input[name=rates_other4]").val();
var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
var rates_other4_sum = commodity_wm * parseFloat(rates_other4)||0;
$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other4_amount','value':rates_other4_sum.toFixed(2)});
$('input[name=\'rates_other4_amount\']').val(rates_other4_sum.toFixed(2));	}
);
</script>
<script type="text/javascript">$(document).ready(function() {var cost_thc_amount = $("input[name=cost_thc_amount]").val();
	var qtthccostr = $("#qtthccostr").val();
	var qtthccostm = $("#qtthccostm").val();
	var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(qtthccostr)||0;
	if (ocean_sum<qtthccostm){ocean_sum = qtthccostm};
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_thc_amount', 'value':ocean_sum});
	$('input[name=\'cost_thc_amount\']').val(ocean_sum);
});
	
</script>
<script type="text/javascript">$(document).ready(function() {var cost_oncarriage_amount = $("input[name=cost_oncarriage_amount]").val();

</script>
<script type="text/javascript">$(document).ready(function() {var qtcustccost = $("#qtcustccost").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtcustccost', 'value':qtcustccost});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_clearance_amount', 'value':qtcustccost});
	$('input[name=\'cost_clearance_amount\']').val(qtcustccost);
	$('input[name=\'qtcustccost\']').val(qtcustccost);
	});
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
<script type="text/javascript">$("input[name=rates_thc]").live('change',function(){
	var rates_thc = $("#rates_thc").val();
	var rates_thc_min = $("input[name=rates_thc_min]").val();
	var rates_thc_min2 = parseFloat(rates_thc_min);	
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));	var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};	
	var ocean_sum = commodity_wm * parseFloat(rates_thc)||0;
	if (ocean_sum<rates_thc_min2){ocean_sum = rates_thc_min2};	
	var ocean_sum = ocean_sum.toFixed(2);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_thc_amount','value':ocean_sum} );	
	$('input[name=\'rates_thc_amount\']').val(ocean_sum);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_thc', 'value':rates_thc});
	});</script>
<script type="text/javascript">$("input[name=rates_thc_min]").live('change',function(){	
	var rates_thc = $("#rates_thc").val();var rates_thc = parseFloat(rates_thc).toFixed(2);	var rates_thc_min = $("#rates_thc_min").val();	var rates_thc_min2 = parseFloat(rates_thc_min);var regexp=/\D/g;	var commodity_cbm = $("input[name='commodity_cbm']").val();	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));var commodity_kg = $("input[name='commodity_kg']").val();	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};var ocean_sum = commodity_wm * parseFloat(rates_thc)||0;if (ocean_sum<rates_thc_min2){ocean_sum = rates_thc_min2};	var ocean_sum = ocean_sum.toFixed(2);$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_thc_amount','value':ocean_sum} );$('input[name=\'rates_thc_amount\']').val(ocean_sum);	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_thc_min', 'value':rates_thc_min});});	</script>
<script type="text/javascript">$("input[name=rates_destdocs]").live('change',function(){
	var rates_destdocs = $("#rates_destdocs").val();
	var rates_destdocs = parseFloat(rates_destdocs).toFixed(2);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_destdocs', 'value':rates_destdocs});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_destdocs_amount', 'value':rates_destdocs});	
	$('input[name=\'rates_destdocs\']').val(rates_destdocs);$('input[name=\'rates_destdocs_amount\']').val(rates_destdocs);	}
	);
</script>
<script type="text/javascript">$("input[name=rates_customsclearance]").live('change',function(){	
	var rates_customsclearance = $("#rates_customsclearance").val();var rates_customsclearance = parseFloat(rates_customsclearance).toFixed(2);$('input[name=\'rates_customsclearance\']').val(rates_customsclearance);$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_customsclearance', 'value':rates_customsclearance});$('input[name=\'rates_customsclearance_amount\']').val(rates_customsclearance);	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_customsclearance_amount', 'value':rates_customsclearance});	});</script>
<script type="text/javascript">$("input[name=rates_aesfilingbytcl]").live('change',function(){
	var rates_aesfilingbytcl = $("#rates_aesfilingbytcl").val();
	var rates_aesfilingbytcl = parseFloat(rates_aesfilingbytcl).toFixed(2);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_aesfilingbytcl', 'value':rates_aesfilingbytcl});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_aesfilingbytcl_amount', 'value':rates_aesfilingbytcl});	
	$('input[name=\'rates_aesfilingbytcl\']').val(rates_aesfilingbytcl);$('input[name=\'rates_aesfilingbytcl_amount\']').val(rates_aesfilingbytcl);
	});</script>
<script type="text/javascript">$("input[name=rates_hazardous]").live('change',function(){
	var rates_hazardous = $("#rates_hazardous").val();	
	var rates_hazardous_min = $("#rates_hazardous_min").val();	
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
	var ocean_sum = ocean_sum.toFixed(2);
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_hazardous', 'value':rates_hazardous});	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_hazardous_min', 'value':rates_hazardous_min2.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_hazardous_amount','value':ocean_sum} );		
	
	$('input[name=\'rates_hazardous\']').val(rates_hazardous);
	$('input[name=\'rates_hazardous_min\']').val(rates_hazardous_min);
	$('input[name=\'rates_hazardous_amount\']').val(ocean_sum);	
	
	});
</script>
<script type="text/javascript">$("input[name=rates_hazardous_min]").live('change',function(){	
	var rates_hazardous = $("#rates_hazardous").val();	
	var rates_hazardous_min = $("#rates_hazardous_min").val();	
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
	var ocean_sum = ocean_sum.toFixed(2);
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_hazardous', 'value':rates_hazardous});	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_hazardous_min', 'value':rates_hazardous_min2.toFixed(2)});
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_hazardous_amount','value':ocean_sum} );		
	
	$('input[name=\'rates_hazardous\']').val(rates_hazardous);
	$('input[name=\'rates_hazardous_min\']').val(rates_hazardous_min);
	$('input[name=\'rates_hazardous_amount\']').val(ocean_sum);	
	
	});
</script>	
<script type="text/javascript">$("input[name=rates_precarriage]").live('change',function(){	
	var rates_precarriage = $("#rates_precarriage").val();
	var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();
	var rates_precarriage_min2 = parseFloat(rates_precarriage_min);var regexp=/\D/g;var commodity_lbs = $("input[name='commodity_lbs']").val();	var commodity_lbs2 = Number(commodity_lbs.replace(/[^0-9\.]+/g,""));var commodity_lbs3 = parseFloat(commodity_lbs2 * 0.01);var commodity_wm = commodity_lbs3;
	var rates_precarriage_sum = commodity_wm * parseFloat(rates_precarriage)||0;var rates_precarriage_sum = rates_precarriage_sum.toFixed(2);
	
	if (rates_precarriage_sum < rates_precarriage_min2){rates_precarriage_sum = rates_precarriage_min2};
	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_precarriage_amount','value':rates_precarriage_sum});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage', 'value':rates_precarriage});
	
	$('input[name=\'rates_precarriage\']').val(rates_precarriage);
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_sum);
	
	});
</script>
<script type="text/javascript">$("input[name=rates_precarriage_min]").live('change',function(){
	var rates_precarriage = $("#rates_precarriage").val();
	var rates_precarriage_min = $("input[name=rates_precarriage_min]").val();
	var rates_precarriage_min2 = parseFloat(rates_precarriage_min);
	
	var regexp=/\D/g;var commodity_lbs = $("input[name='commodity_lbs']").val();	var commodity_lbs2 = Number(commodity_lbs.replace(/[^0-9\.]+/g,""));var commodity_lbs3 = parseFloat(commodity_lbs2 * 0.01);	var commodity_wm = commodity_lbs3;var rates_precarriage_sum = commodity_wm * parseFloat(rates_precarriage)||0;
	
	var rates_precarriage_sum = rates_precarriage_sum.toFixed(2);
	
	if (rates_precarriage_sum < rates_precarriage_min2){rates_precarriage_sum = rates_precarriage_min2.toFixed(2)};
	
	$('input[name=\'rates_precarriage\']').val(rates_precarriage);
	$('input[name=\'rates_precarriage_min\']').val(rates_precarriage_min);
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_sum);
	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_precarriage_amount','value':rates_precarriage_sum});	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage_min', 'value':rates_precarriage_min});	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage', 'value':rates_precarriage});
	
	});
</script>
<script type="text/javascript">$("input[name=rates_line_haul]").live('change',function(){
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
	
	}
	);
</script>
<script type="text/javascript">$("input[name=rates_line_haul_min]").live('change',function(){
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
	}
	);</script>
<script type="text/javascript">$("input[name=truckercontact]").live('change',function(){
	var truckercontact = $("#truckercontact").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckercontact','value':truckercontact});
	$('input[name=\'truckercontact\']').val(truckercontact);}
	);
</script>
<script type="text/javascript">$("input[name=truckertelephone]").live('change',function(){
	var truckertelephone = $("#truckertelephone").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckertelephone','value':truckertelephone});
	$('input[name=\'truckertelephone\']').val(truckertelephone);}
	);
</script>
<script type="text/javascript">$("input[name=truckerfax]").live('change',function(){
	var truckerfax = $("#truckerfax").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckerfax','value':truckerfax});
	$('input[name=\'truckerfax\']').val(truckerfax);}
	);
</script>
<script type="text/javascript">$("input[name=truckingemail]").live('change',function(){
	var truckingemail = $("#truckingemail").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'truckingemail','value':truckingemail});
	$('input[name=\'truckingemail\']').val(truckingemail);}
	);
</script>
<script type="text/javascript">$("input[name=truckingrate]").live('change',function(){	
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
<script type="text/javascript">$("input[name=truckingrate_min]").live('change',function(){
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
<script type="text/javascript">$("input[name=truckingrate_max_profit]").live('change',function(){
	
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
<script type="text/javascript">$("input[name=truckingrate_sell]").live('change',function(){	
	var truckingrate_sell = $("#truckingrate_sell").val();
	var truckingrate_min_sell = $("input[name=truckingrate_min_sell]").val();
	var truckingrate_min_sell2 = parseFloat(truckingrate_min_sell);
	
	var regexp=/\D/g;var commodity_lbs = $("input[name='commodity_lbs']").val();var commodity_lbs2 = Number(commodity_lbs.replace(/[^0-9\.]+/g,""));var commodity_lbs3 = parseFloat(commodity_lbs2 * 0.01);var commodity_wm = commodity_lbs3;
	var rates_precarriage_sum = commodity_wm * parseFloat(truckingrate_sell)||0;
	var rates_precarriage_sum = rates_precarriage_sum.toFixed(2);
	
	if (rates_precarriage_sum < truckingrate_min_sell2){rates_precarriage_sum = rates_precarriage_min2};
	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_precarriage_amount','value':rates_precarriage_sum});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage', 'value':truckingrate_sell});
	
	$('input[name=\'rates_precarriage\']').val(truckingrate_sell);
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_sum);

	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_sell', 'value':truckingrate_sell});
	}
	);
</script>
<script type="text/javascript">$("input[name=truckingrate_min_sell]").live('change',function(){
	var truckingrate_sell = $("#truckingrate_sell").val();
	var truckingrate_min_sell = $("input[name=truckingrate_min_sell]").val();
	var truckingrate_min_sell2 = parseFloat(truckingrate_min_sell);
	
	var regexp=/\D/g;
	var commodity_lbs = $("input[name='commodity_lbs']").val();	
	var commodity_lbs2 = Number(commodity_lbs.replace(/[^0-9\.]+/g,""));
	var commodity_lbs3 = parseFloat(commodity_lbs2 * 0.01);	
	var commodity_wm = commodity_lbs3;
	
	var rates_precarriage_sum = commodity_wm * parseFloat(truckingrate_sell)||0;
	
	var truckingrate_sell_sum = truckingrate_sell_sum.toFixed(2);
	
	if (truckingrate_sell_sum < truckingrate_min_sell2){truckingrate_sell_sum = truckingrate_min_sell2.toFixed(2)};
	
	$('input[name=\'rates_precarriage\']').val(rates_precarriage);
	$('input[name=\'rates_precarriage_amount\']').val(rates_precarriage_sum);
	$('input[name=\'rates_precarriage_amount\']').val(truckingrate_sell_sum);
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_precarriage_amount','value':rates_precarriage_sum});	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_precarriage_min', 'value':rates_precarriage_min});	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'truckingrate_min_sell', 'value':rates_precarriage_min});}
	
	);
</script>
<script type="text/javascript">$("input[name=instruction]").live('change',function(){
	var instruction = $("#instruction").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'instruction','value':instruction});
	$('input[name=\'instruction\']').val(instruction);}
	);
</script>
<script type="text/javascript">$("input[name=innerpiece]").live('change',function(){
	var innerpiece = $("#innerpiece").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'innerpiece','value':innerpiece});
	$('input[name=\'innerpiece\']').val(innerpiece);}
	);
</script>
<script type="text/javascript">$("textarea[name=bkpuspecinst]").live('change',function(){
	var bkpuspecinst = $("#bkpuspecinst").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'bkpuspecinst','value':bkpuspecinst});
	$('textarea[name=\'bkpuspecinst\']').val(bkpuspecinst);}
	);
</script>
<script type="text/javascript">$("input[name=pickupShipper]").live('change',function(){
	var pickupShipper = $("#pickupShipper").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupShipper','value':pickupShipper});
	$('input[name=\'pickupShipper\']').val(pickupShipper);}
	);
</script>
<script type="text/javascript">$("input[name=pickupAddress]").live('change',function(){
	var pickupAddress = $("#pickupAddress").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupAddress','value':pickupAddress});
	$('input[name=\'pickupAddress\']').val(pickupAddress);}
	);
</script>
<script type="text/javascript">$("input[name=pickupcontact]").live('change',function(){
	var pickupcontact = $("#pickupcontact").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupcontact','value':pickupcontact});
	$('input[name=\'pickupcontact\']').val(pickupcontact);}
	);
</script>
<script type="text/javascript">$("input[name=pickuptelephone]").live('change',function(){
	var pickuptelephone = $("#pickuptelephone").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickuptelephone','value':pickuptelephone});
	$('input[name=\'pickuptelephone\']').val(pickuptelephone);}
	);
</script>
<script type="text/javascript">$("input[name=pickupfax]").live('change',function(){
	var pickupfax = $("#pickupfax").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupfax','value':pickupfax});
	$('input[name=\'pickupfax\']').val(pickupfax);}
	);
</script>
<script type="text/javascript">$("input[name=pickupemail]").live('change',function(){
	var pickupemail = $("#pickupemail").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupemail','value':pickupemail});
	$('input[name=\'pickupemail\']').val(pickupemail);}
	);
</script>
<script type="text/javascript">$("input[name=pickupReceivingHrs]").live('change',function(){
	var pickupReceivingHrs = $("#pickupReceivingHrs").val();
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupReceivingHrs','value':pickupReceivingHrs});
	$('input[name=\'pickupReceivingHrs\']').val(pickupReceivingHrs);}
	);
</script>
<script type="text/javascript">$("input[name=pickupreadydate]").live('change',function(){
	var pickupreadydate = $("#pickupreadydate").val();
	var readydate = $("#readydate").val();
	if(readydate){
		pickupreadydate = readydate ;	
	}
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'pickupreadydate','value':pickupreadydate});
	$('input[name=\'pickupreadydate\']').val(pickupreadydate);}
	);
</script>
<script type="text/javascript">$("input[name=hazclass1]").live('change',function(){	
	var hazclass1 = $("#hazclass1").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass1','value':hazclass1} );
	$('input[name=\'hazclass1\']').val(hazclass1);	
	
	});	</script>
<script type="text/javascript">$("input[name=hazclass2]").live('change',function(){	
	var hazclass2 = $("#hazclass2").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass2','value':hazclass2} );
	$('input[name=\'hazclass2\']').val(hazclass2);	
	
	});	</script>	
<script type="text/javascript">$("input[name=hazclass3]").live('change',function(){	
	var hazclass3 = $("#hazclass3").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'hazclass3','value':hazclass3} );
	$('input[name=\'hazclass3\']').val(hazclass3);	
	
	});	</script>
<script type="text/javascript">$("input[name=un]").live('change',function(){	
	var un = $("#un").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'un','value':un} );
	$('input[name=\'un\']').val(un);	
	
	});	</script>	
<script type="text/javascript">$("input[name=commodity_hazardous_approval]").live('change',function(){	
	var commodity_hazardous_approval = $("#commodity_hazardous_approval").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'commodity_hazardous_approval','value':commodity_hazardous_approval} );
	$('input[name=\'commodity_hazardous_approval\']').val(commodity_hazardous_approval);	
	
	});	</script>	

	
<script type="text/javascript">$("textarea[name=notes_ops_add]").change(function(){
	
	var notes_ops_add =$("#notes_ops_add").val();
	
	var notes_ops_list= new Array();
	
	notes_ops_list[0]=encodeURI(notes_ops_add);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'notes_ops_add', 'value':notes_ops_add});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'notes_ops_list', 'value':notes_ops_list});
	
	}
	);
	</script>			

<script type="text/javascript">$("input[name=rates_chassissurcharge]").live('change',function(){
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
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_chassissurcharge_min', 'value':rates_chassissurcharge_min2});	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_chassissurcharge_amount','value':ocean_sum} );		
	$('input[name=\'rates_chassissurcharge_amount\']').val(ocean_sum);	
	$('input[name=\'rates_chassissurcharge_min\']').val(rates_chassissurchargemin2);	
	$('input[name=\'rates_chassissurcharge\']').val(rates_chassissurcharge);});
	</script>
<script type="text/javascript">$("input[name=rates_chassissurcharge_min]").live('change',function(){
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
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_chassissurcharge_min', 'value':rates_chassissurcharge_min2});	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_chassissurcharge_amount','value':ocean_sum} );		
	$('input[name=\'rates_chassissurcharge_amount\']').val(ocean_sum);	
	$('input[name=\'rates_chassissurcharge_min\']').val(rates_chassissurchargemin2);	
	$('input[name=\'rates_chassissurcharge\']').val(rates_chassissurcharge);});
	</script>	
<script type="text/javascript">$("input[name=rates_hazsurcharge_cost]").live('change',function(){	
	var rates_hazsurcharge_cost = $("#rates_hazsurcharge_cost").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_hazsurcharge_cost','value':rates_hazsurcharge_cost} );
	$('input[name=\'rates_hazsurcharge_cost\']').val(rates_hazsurcharge_cost);	
	
	});	
	</script>
<script type="text/javascript">$("input[name=rates_hazsurcharge_cost_min]").live('change',function(){	
	var rates_hazsurcharge_cost_min = $("#rates_hazsurcharge_cost_min").val();	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_hazsurcharge_cost_min','value':rates_hazsurcharge_cost_min} );
	$('input[name=\'rates_hazsurcharge_cost_min\']').val(rates_hazsurcharge_cost_min);	
	
	});	
</script>	
<script type="text/javascript">$("input[name=rates_brokerage_percentage_min]").live('change',function(){
	var ocean_freight = $("input[name=rates_oceanfreight_amount]").val();
	var rates_brokerage_percentage = $("#rates_brokerage_percentage_min").val();
	var rates_brokerage_total = (parseFloat(rates_brokerage_percentage)*(parseFloat(ocean_freight)/100));	
	$('input[name=\'rates_brokerage_percentage_amount\']').val(rates_brokerage_total.toFixed(2));
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_min', 'value':rates_brokerage_percentage});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_brokerage_percentage_amount', 'value':rates_brokerage_total});
	
	}
	);
	
	</script>
<script type="text/javascript">$("input[name=rates_other3]").live('change',function(){
		var rates_other3 = $("#rates_other3").val();var rates_other3 = parseFloat(rates_other3).toFixed(2);var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};var rates_other3_sum = commodity_wm * parseFloat(rates_other3)||0;var rates_other3_sum = rates_other3_sum.toFixed(2);	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other3_amount','value':rates_other3_sum} );$('input[name=\'rates_other3_amount\']').val(rates_other3_sum);	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_other3', 'value':rates_other3});});</script>	
<script type="text/javascript">$("input[name=rates_other4]").live('change',function(){
	var rates_other4 = $("#rates_other4").val();var rates_other4 = parseFloat(rates_other4).toFixed(2);var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));var commodity_kg = $("input[name='commodity_kg']").val();var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};var rates_other4_sum = commodity_wm * parseFloat(rates_other4)||0;var rates_other4_sum = rates_other4_sum.toFixed(2);	
	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'rates_other4_amount','value':rates_other4_sum} );	$('input[name=\'rates_other4_amount\']').val(rates_other4_sum);	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'rates_other4', 'value':rates_other4});}
	);</script>		
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
	});</script>	

<script type="text/javascript">$("input[name=costs_destdocs]").live('change',function(){
	var costs_destdocs = $("#costs_destdocs").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'costs_destdocs', 'value':costs_destdocs});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_destdocs_amount', 'value':qtdestdcost});
	$('input[name=\'costs_destdocs\']').val(costs_destdocs);
	$('input[name=\'cost_destdocs_amount\']').val(costs_destdocs);
	});
</script>	
	
<script type="text/javascript">$("input[name=qtthccostr]").live('change',function(){
	var qtthccostr = $("#qtthccostr").val();
	var qtthccostm = $("#qtthccostm").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(qtthccostr)||0;
	if (ocean_sum<qtthccostm){ocean_sum = qtthccostm};
	
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtthccostr', 'value':qtthccostr});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtthccostm', 'value':qtthccostm});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_thc_amount', 'value':ocean_sum});
	$('input[name=\'qtthccostr\']').val(qtthccostr);
	$('input[name=\'qtthccostm\']').val(qtthccostm);
	$('input[name=\'cost_thc_amount\']').val(ocean_sum);
	});
</script>	
<script type="text/javascript">$("input[name=qtthccostm]").live('change',function(){
	var qtthccostr =$("input[name=qtthccostr]").val();
	var qtthccostm =$("input[name=qtthccostm]").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(qtthccostr)||0;
	if (ocean_sum<qtthccostm){ocean_sum = qtthccostm};
	
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtthccostr', 'value':qtthccostr});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtthccostm', 'value':qtthccostm});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_thc_amount', 'value':ocean_sum});
	$('input[name=\'cost_thc_amount\']').val(ocean_sum);	
	});
</script>
<script type="text/javascript">$("input[name=qtoncarrcost]").live('change',function(){
	var qtoncarrcost = $("#qtoncarrcost").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtoncarrcost', 'value':qtoncarrcost});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_oncarriage_amount', 'value':qtoncarrcost});
	$('input[name=\'qtoncarrcost\']').val(qtoncarrcost);
	$('input[name=\'cost_oncarriage_amount\']').val(qtoncarrcost);
	}
	);</script>	
<script type="text/javascript">$("input[name=QtFCurr]").change(function(){
	var QtFCurr = $("#QtFCurr").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'QtFCurr', 'value':QtFCurr});
	}
	);</script>	
<script type="text/javascript">$("input[name=qtcustccost]").live('change',function(){
	var qtcustccost = $("#qtcustccost").val();
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qtcustccost', 'value':qtcustccost});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_clearance_amount', 'value':qtcustccost});
	$('input[name=\'cost_clearance_amount\']').val(qtcustccost);
	$('input[name=\'qtcustccost\']').val(qtcustccost);
	});</script>
<script type="text/javascript">$("input[name=qthazcost]").change(function(){
	var qthazcost = $("#qthazcost").val();
	var qthazcostmin = $("#qthazcostmin").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(qthazcost)||0;
	if (ocean_sum<qthazcostmin){ocean_sum = qthazcostmin};
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qthazcost', 'value':qthazcost});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qthazcostmin', 'value':qthazcostmin});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_haz_amount', 'value':ocean_sum});
	$('input[name=\'cost_haz_amount\']').val(ocean_sum);
	}
	);</script>
<script type="text/javascript">$("input[name=qthazcostmin]").change(function(){
	var qthazcost = $("#qthazcost").val();
	var qthazcostmin = $("#qthazcostmin").val();
	var regexp=/\D/g;var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	var ocean_sum = commodity_wm * parseFloat(qthazcost)||0;
	if (ocean_sum<qthazcostmin){ocean_sum = qthazcostmin};
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qthazcost', 'value':qthazcost});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'qthazcostmin', 'value':qthazcostmin});
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cost_haz_amount', 'value':ocean_sum});
	$('input[name=\'cost_haz_amount\']').val(ocean_sum);
	}
	);</script>

<script type="text/javascript">$(document).ready(function() {calculateSum();$(".txt").live("keydown keyup", function() {calculateSum();});}); function calculateSum() {var sum = 0; $(".txt").each(function() {if (!isNaN(this.value) && this.value.length != 0) {sum += parseFloat(this.value); $(this).css("background-color", "#FEFFB0"); } else if (this.value.length != 0){$(this).css("background-color", "red"); }});	$("#sum").html(sum.toFixed(2));$("#sum2").html(sum.toFixed(2));	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total', 'value':(sum.toFixed(2))});}</script>

<script type="text/javascript">$(document).ready(function() {
	var regexp=/\D/g;
	var commodity_cbm = $("input[name='commodity_cbm']").val();
	var commodity_cbm3 = Number(commodity_cbm.replace(/[^0-9\.]+/g,""));
	var commodity_kg = $("input[name='commodity_kg']").val();
	var commodity_kg2 = Number(commodity_kg.replace(/[^0-9\.]+/g,""));
	var commodity_kg3 = parseFloat(commodity_kg2 * 0.001);
	var commodity_wm = commodity_cbm3;
	if (commodity_cbm3 < commodity_kg3){ commodity_wm = commodity_kg3};
	if (commodity_wm >.01){calculateSum()};
	
	$(".txt").live("keydown keyup", function() {calculateSum();});}); 
	
	function calculateSum() {
		var sum = 0; 
		$(".txt").each(function() {
			if (!isNaN(this.value) && this.value.length != 0) {sum += parseFloat(this.value); 
			$(this).css("background-color", "#FEFFB0"); } else if (this.value.length != 0){$(this).css("background-color", "red"); }
			});	
		
		$("#sum").html(sum.toFixed(2));	
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'total', 'value':(sum)})
	;}
	
	
	
	</script>

<script type="text/javascript">$(document).ready(function() {calculateSumDebit();
$(".txtDebit").live("keydown keyup", function() {
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
$(".txtCredit_quote").live("keydown keyup", function() {
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
$(".txtCredit_booking").live("keydown keyup", function() {
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

<!--/Async fields/-->
<script type="text/javascript">$(document).ready(function() {$('#readydate').datepicker({dateFormat: 'yy-mm-dd'});$('#idd').datepicker({dateFormat: 'mm-dd-yy'});$('#date-end').datepicker({dateFormat: 'mm-dd-yy'});});</script>
<script type="text/javascript">$("input[name='readydate']").change(function(){var readydate = $("#readydate").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'readydate', 'value':readydate});$('input[name=\'readydate\']').val(readydate);});</script>	
<script type="text/javascript">$("input[name=service_por]").change(function(){var service_por = $("#service_por").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_por', 'value':service_por});$('input[name=\'service_por\']').val(service_por);});</script>	
<script type="text/javascript">$("input[name=service_pod]").change(function(){var service_pod = $("#service_pod").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_pod', 'value':service_pod});});</script>	
<script type="text/javascript">$("input[name=service_zip]").change(function(){var service_zip = $("#service_zip").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_zip', 'value':service_zip});});</script>	
<script type="text/javascript">$("input[name=commodity]").change(function(){var commodity =$("#commodity").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity', 'value':commodity});});</script>	
<script type="text/javascript">$("input[name=customerref]").change(function(){var customerref =$("#customerref").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerref', 'value':customerref});});</script>	
<script type="text/javascript">$("textarea[name=comments]").change(function(){var comments =$("#comments").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'comments', 'value':comments});});</script>	
<script type="text/javascript">$("input[name=commodity_package_type]").change(function(){var commodity_package_type =$("#commodity_package_type").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'commodity_package_type', 'value':commodity_package_type});});</script>	

<script type="text/javascript">$("input[name=cpytosalesrep]").change(function(){var cpytosalesrep =$("#cpytosalesrep").is(':checked') ? true : false;
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'cpytosalesrep', 'value':cpytosalesrep})	;});
</script>	
<script type="text/javascript">$("input[name=pickup]").change(function(){var pickup =$("#pickup").is(':checked') ? true : false;
$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickup', 'value':pickup})	;});
</script>	
<script type="text/javascript">$("input[name=destination_service]").change(function(){var destination_service =$("#destination_service").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'destination_service', 'value':destination_service});});</script>	
<script type="text/javascript">$("input[name=doormove]").change(function(){
	var doormove =$("#doormove").is(':checked') ? true : false;
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'doormove', 'value':doormove});}	
	);</script>	
<script type="text/javascript">$("input[name=delivery]").change(function(){
	var delivery=$("#delivery").is(':checked') ? true : false;
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'delivery', 'value':delivery});}	
	);
</script>
<script type="text/javascript">$("input[name=nodelivery]").change(function(){
	var nodelivery =$("#nodelivery").is(':checked') ? true : false;
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'nodelivery', 'value':nodelivery});}	
	);
</script>	
<script type="text/javascript">$("input[name=service_decaes]").change(function(){	
	var service_decaes =$("#service_decaes").is(':checked') ? true : false;
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_decaes', 'value':service_decaes});}
	);</script>	
<script type="text/javascript">$("input[name=destdocs]").change(function(){	var destdocs =$("#destdocs").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'destdocs', 'value':destdocs});});</script>	
<script type="text/javascript">$("input[name=customs]").change(function(){var customs =$("#customs").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customs', 'value':customs});});</script>	
<script type="text/javascript">$("input[name=thc]").change(function(){var thc =$("#thc").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'thc', 'value':thc});});</script>	
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
<script type="text/javascript">$("input[name=brokerage]").change(function(){var brokerage =$("#brokerage").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'brokerage', 'value':brokerage})	;});</script>
<script type="text/javascript">$("input[name=hazardous]").change(function(){var hazardous =$("#hazardous").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'hazardous', 'value':hazardous})	;});</script>
<script type="text/javascript">$("input[name=brokerage]").change(function(){var brokerage =$("#brokerage").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'brokerage', 'value':brokerage})	;});</script>	
<script type="text/javascript">$("input[name=forwardadvance]").change(function(){var forwardadvance =$("#forwardadvance").is(':checked') ? true : false;$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'forwardadvance', 'value':forwardadvance})	;});</script>	
<script type="text/javascript">$("input[name=aes]").change(function(){var aes =$("#aes"); aes.attr('selected','selected');$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'aes', 'value':aes})	;});</script>		
<script type="text/javascript">$("input[name=custtelephone]").change(function(){var custtelephone = $("#custtelephone").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custtelephone', 'value':custtelephone});});</script>
<script type="text/javascript">$("input[name=custfax]").change(function(){var custfax = $("#custfax").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custfax', 'value':custfaxd});});</script>
<script type="text/javascript">$("input[name=customerName]").change(function(){
		var CustLastR = "<?php echo $CustLastR ;?>";
		if (CustLasrR){	$.post('controller/setting/ajaxpersist.php', {'fieldname' : 'CustLasrR','value':CustLastR});	};
	});

	</script>	
<script type="text/javascript">$("input[name=customerSignator]").change(function(){var customerSignator = $("#customerSignator").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerSignator', 'value':customerSignator});});</script>
<script type="text/javascript">$("input[name=customerConsignee]").change(function(){var customerConsignee = $("#customerConsignee").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerConsignee', 'value':customerConsignee});});</script>
<script type="text/javascript">$("input[name=customerNotify]").change(function(){var customerNotify = $("#customerNotify").val();$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerNotify', 'value':customerNotify});});</script>
<script type="text/javascript">$("input[name=pickuppresidentialpu]").change(function(){
	var pickuppresidentialpu =$("#pickuppresidentialpu").is(':checked') ? true : false;
	$('input[name=\'pickuppresidentialpu\']').val(pickuppresidentialpu);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickuppresidentialpu', 'value':pickuppresidentialpu})	;});
</script>	
<script type="text/javascript">$("input[name=pickupliftgate]").change(function(){
	var pickupliftgate =$("#pickupliftgate").is(':checked') ? true : false;
	$('input[name=\'pickupliftgate\']').val(pickupliftgate);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupliftgate', 'value':pickupliftgate})	;});
</script>	
<script type="text/javascript">$("input[name=pickupexcesslen]").change(function(){
	var pickupexcesslen =$("#pickupexcesslen").is(':checked') ? true : false;
	$('input[name=\'pickupexcesslen\']').val(pickupexcesslen);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupexcesslen', 'value':pickupexcesslen})	;});
</script>
<script type="text/javascript">$("input[name=pickupappt]").change(function(){
	var pickupappt =$("#pickupappt").is(':checked') ? true : false;
	$('input[name=\'pickupappt\']').val(pickupappt);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'pickupappt', 'value':pickupappt})	;});
</script>
<script type="text/javascript">$("input[name=service_portofdest_charge]").change(function(){
	var service_portofdest_charge =$("#service_portofdest_charge").is(':checked') ? true : false;
	$('input[name=\'service_portofdest_charge\']').val(service_portofdest_charge);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'service_portofdest_charge', 'value':service_portofdest_charge})	;});
</script>

<script type="text/javascript">function ConvertWeightMetric(){$("#commodity_lbs").load("index.php?route=service/booking&token=<?php echo $token; ?> #commodity_kg");});</script>
<script type="text/javascript">function displayAgent() {$("#service_hidden").toggle(); }</script>
<script type="text/javascript">function displayWarehouse() {$("#warehouse_hidden").toggle(); }</script>
<script type="text/javascript">function displayTruckCarrier() {$(".carrier_hidden").toggle(); }</script>
<script type="text/javascript">$(document).ready(function() {
	$('#readydate').datepicker({dateFormat: 'mm-dd-yy'});
	$('#idd').datepicker({dateFormat: 'mm-dd-yy'});
	$('#pickupreadydate').datepicker({dateFormat: 'mm-dd-yy'});});
$('#date-end').datepicker({dateFormat: 'mm-dd-yy'});});
</script>
<script type="text/javascript">$('#tabs a').tabs();</script> 


<script type="text/javascript">$(document).ready(function() {$('.colorbox').colorbox({width: 640,height: 480});});</script>
<script src="view/javascript/jquery/colorbox/jquery.colorbox-min.js" type="text/javascript">
// ColorBox v1.3.19 - jQuery lightbox plugin
// (c) 2011 Jack Moore - jacklmoore.com
// License: http://www.opensource.org/licenses/mit-license.php
(function(a,b,c){function Z(c,d,e){var g=b.createElement(c);return d&&(g.id=f+d),e&&(g.style.cssText=e),a(g)}function $(a){var b=y.length,c=(Q+a)%b;return c<0?b+c:c}function _(a,b){return Math.round((/%/.test(a)?(b==="x"?z.width():z.height())/100:1)*parseInt(a,10))}function ba(a){return K.photo||/\.(gif|png|jpe?g|bmp|ico)((#|\?).*)?$/i.test(a)}function bb(){var b;K=a.extend({},a.data(P,e));for(b in K)a.isFunction(K[b])&&b.slice(0,2)!=="on"&&(K[b]=K[b].call(P));K.rel=K.rel||P.rel||"nofollow",K.href=K.href||a(P).attr("href"),K.title=K.title||P.title,typeof K.href=="string"&&(K.href=a.trim(K.href))}function bc(b,c){a.event.trigger(b),c&&c.call(P)}function bd(){var a,b=f+"Slideshow_",c="click."+f,d,e,g;K.slideshow&&y[1]?(d=function(){F.text(K.slideshowStop).unbind(c).bind(j,function(){if(K.loop||y[Q+1])a=setTimeout(W.next,K.slideshowSpeed)}).bind(i,function(){clearTimeout(a)}).one(c+" "+k,e),r.removeClass(b+"off").addClass(b+"on"),a=setTimeout(W.next,K.slideshowSpeed)},e=function(){clearTimeout(a),F.text(K.slideshowStart).unbind([j,i,k,c].join(" ")).one(c,function(){W.next(),d()}),r.removeClass(b+"on").addClass(b+"off")},K.slideshowAuto?d():e()):r.removeClass(b+"off "+b+"on")}function be(b){U||(P=b,bb(),y=a(P),Q=0,K.rel!=="nofollow"&&(y=a("."+g).filter(function(){var b=a.data(this,e).rel||this.rel;return b===K.rel}),Q=y.index(P),Q===-1&&(y=y.add(P),Q=y.length-1)),S||(S=T=!0,r.show(),K.returnFocus&&a(P).blur().one(l,function(){a(this).focus()}),q.css({opacity:+K.opacity,cursor:K.overlayClose?"pointer":"auto"}).show(),K.w=_(K.initialWidth,"x"),K.h=_(K.initialHeight,"y"),W.position(),o&&z.bind("resize."+p+" scroll."+p,function(){q.css({width:z.width(),height:z.height(),top:z.scrollTop(),left:z.scrollLeft()})}).trigger("resize."+p),bc(h,K.onOpen),J.add(D).hide(),I.html(K.close).show()),W.load(!0))}function bf(){!r&&b.body&&(Y=!1,z=a(c),r=Z(X).attr({id:e,"class":n?f+(o?"IE6":"IE"):""}).hide(),q=Z(X,"Overlay",o?"position:absolute":"").hide(),s=Z(X,"Wrapper"),t=Z(X,"Content").append(A=Z(X,"LoadedContent","width:0; height:0; overflow:hidden"),C=Z(X,"LoadingOverlay").add(Z(X,"LoadingGraphic")),D=Z(X,"Title"),E=Z(X,"Current"),G=Z(X,"Next"),H=Z(X,"Previous"),F=Z(X,"Slideshow").bind(h,bd),I=Z(X,"Close")),s.append(Z(X).append(Z(X,"TopLeft"),u=Z(X,"TopCenter"),Z(X,"TopRight")),Z(X,!1,"clear:left").append(v=Z(X,"MiddleLeft"),t,w=Z(X,"MiddleRight")),Z(X,!1,"clear:left").append(Z(X,"BottomLeft"),x=Z(X,"BottomCenter"),Z(X,"BottomRight"))).find("div div").css({"float":"left"}),B=Z(X,!1,"position:absolute; width:9999px; visibility:hidden; display:none"),J=G.add(H).add(E).add(F),a(b.body).append(q,r.append(s,B)))}function bg(){return r?(Y||(Y=!0,L=u.height()+x.height()+t.outerHeight(!0)-t.height(),M=v.width()+w.width()+t.outerWidth(!0)-t.width(),N=A.outerHeight(!0),O=A.outerWidth(!0),r.css({"padding-bottom":L,"padding-right":M}),G.click(function(){W.next()}),H.click(function(){W.prev()}),I.click(function(){W.close()}),q.click(function(){K.overlayClose&&W.close()}),a(b).bind("keydown."+f,function(a){var b=a.keyCode;S&&K.escKey&&b===27&&(a.preventDefault(),W.close()),S&&K.arrowKey&&y[1]&&(b===37?(a.preventDefault(),H.click()):b===39&&(a.preventDefault(),G.click()))}),a("."+g,b).live("click",function(a){a.which>1||a.shiftKey||a.altKey||a.metaKey||(a.preventDefault(),be(this))})),!0):!1}var d={transition:"elastic",speed:300,width:!1,initialWidth:"600",innerWidth:!1,maxWidth:!1,height:!1,initialHeight:"450",innerHeight:!1,maxHeight:!1,scalePhotos:!0,scrolling:!0,inline:!1,html:!1,iframe:!1,fastIframe:!0,photo:!1,href:!1,title:!1,rel:!1,opacity:.9,preloading:!0,current:"image {current} of {total}",previous:"previous",next:"next",close:"close",open:!1,returnFocus:!0,reposition:!0,loop:!0,slideshow:!1,slideshowAuto:!0,slideshowSpeed:2500,slideshowStart:"start slideshow",slideshowStop:"stop slideshow",onOpen:!1,onLoad:!1,onComplete:!1,onCleanup:!1,onClosed:!1,overlayClose:!0,escKey:!0,arrowKey:!0,top:!1,bottom:!1,left:!1,right:!1,fixed:!1,data:undefined},e="colorbox",f="cbox",g=f+"Element",h=f+"_open",i=f+"_load",j=f+"_complete",k=f+"_cleanup",l=f+"_closed",m=f+"_purge",n=!a.support.opacity&&!a.support.style,o=n&&!c.XMLHttpRequest,p=f+"_IE6",q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X="div",Y;if(a.colorbox)return;a(bf),W=a.fn[e]=a[e]=function(b,c){var f=this;b=b||{},bf();if(bg()){if(!f[0]){if(f.selector)return f;f=a("<a/>"),b.open=!0}c&&(b.onComplete=c),f.each(function(){a.data(this,e,a.extend({},a.data(this,e)||d,b))}).addClass(g),(a.isFunction(b.open)&&b.open.call(f)||b.open)&&be(f[0])}return f},W.position=function(a,b){function i(a){u[0].style.width=x[0].style.width=t[0].style.width=a.style.width,t[0].style.height=v[0].style.height=w[0].style.height=a.style.height}var c=0,d=0,e=r.offset(),g=z.scrollTop(),h=z.scrollLeft();z.unbind("resize."+f),r.css({top:-9e4,left:-9e4}),K.fixed&&!o?(e.top-=g,e.left-=h,r.css({position:"fixed"})):(c=g,d=h,r.css({position:"absolute"})),K.right!==!1?d+=Math.max(z.width()-K.w-O-M-_(K.right,"x"),0):K.left!==!1?d+=_(K.left,"x"):d+=Math.round(Math.max(z.width()-K.w-O-M,0)/2),K.bottom!==!1?c+=Math.max(z.height()-K.h-N-L-_(K.bottom,"y"),0):K.top!==!1?c+=_(K.top,"y"):c+=Math.round(Math.max(z.height()-K.h-N-L,0)/2),r.css({top:e.top,left:e.left}),a=r.width()===K.w+O&&r.height()===K.h+N?0:a||0,s[0].style.width=s[0].style.height="9999px",r.dequeue().animate({width:K.w+O,height:K.h+N,top:c,left:d},{duration:a,complete:function(){i(this),T=!1,s[0].style.width=K.w+O+M+"px",s[0].style.height=K.h+N+L+"px",K.reposition&&setTimeout(function(){z.bind("resize."+f,W.position)},1),b&&b()},step:function(){i(this)}})},W.resize=function(a){S&&(a=a||{},a.width&&(K.w=_(a.width,"x")-O-M),a.innerWidth&&(K.w=_(a.innerWidth,"x")),A.css({width:K.w}),a.height&&(K.h=_(a.height,"y")-N-L),a.innerHeight&&(K.h=_(a.innerHeight,"y")),!a.innerHeight&&!a.height&&(A.css({height:"auto"}),K.h=A.height()),A.css({height:K.h}),W.position(K.transition==="none"?0:K.speed))},W.prep=function(b){function g(){return K.w=K.w||A.width(),K.w=K.mw&&K.mw<K.w?K.mw:K.w,K.w}function h(){return K.h=K.h||A.height(),K.h=K.mh&&K.mh<K.h?K.mh:K.h,K.h}if(!S)return;var c,d=K.transition==="none"?0:K.speed;A.remove(),A=Z(X,"LoadedContent").append(b),A.hide().appendTo(B.show()).css({width:g(),overflow:K.scrolling?"auto":"hidden"}).css({height:h()}).prependTo(t),B.hide(),a(R).css({"float":"none"}),o&&a("select").not(r.find("select")).filter(function(){return this.style.visibility!=="hidden"}).css({visibility:"hidden"}).one(k,function(){this.style.visibility="inherit"}),c=function(){function q(){n&&r[0].style.removeAttribute("filter")}var b,c,g=y.length,h,i="frameBorder",k="allowTransparency",l,o,p;if(!S)return;l=function(){clearTimeout(V),C.hide(),bc(j,K.onComplete)},n&&R&&A.fadeIn(100),D.html(K.title).add(A).show();if(g>1){typeof K.current=="string"&&E.html(K.current.replace("{current}",Q+1).replace("{total}",g)).show(),G[K.loop||Q<g-1?"show":"hide"]().html(K.next),H[K.loop||Q?"show":"hide"]().html(K.previous),K.slideshow&&F.show();if(K.preloading){b=[$(-1),$(1)];while(c=y[b.pop()])o=a.data(c,e).href||c.href,a.isFunction(o)&&(o=o.call(c)),ba(o)&&(p=new Image,p.src=o)}}else J.hide();K.iframe?(h=Z("iframe")[0],i in h&&(h[i]=0),k in h&&(h[k]="true"),h.name=f+ +(new Date),K.fastIframe?l():a(h).one("load",l),h.src=K.href,K.scrolling||(h.scrolling="no"),a(h).addClass(f+"Iframe").appendTo(A).one(m,function(){h.src="//about:blank"})):l(),K.transition==="fade"?r.fadeTo(d,1,q):q()},K.transition==="fade"?r.fadeTo(d,0,function(){W.position(0,c)}):W.position(d,c)},W.load=function(b){var c,d,e=W.prep;T=!0,R=!1,P=y[Q],b||bb(),bc(m),bc(i,K.onLoad),K.h=K.height?_(K.height,"y")-N-L:K.innerHeight&&_(K.innerHeight,"y"),K.w=K.width?_(K.width,"x")-O-M:K.innerWidth&&_(K.innerWidth,"x"),K.mw=K.w,K.mh=K.h,K.maxWidth&&(K.mw=_(K.maxWidth,"x")-O-M,K.mw=K.w&&K.w<K.mw?K.w:K.mw),K.maxHeight&&(K.mh=_(K.maxHeight,"y")-N-L,K.mh=K.h&&K.h<K.mh?K.h:K.mh),c=K.href,V=setTimeout(function(){C.show()},100),K.inline?(Z(X).hide().insertBefore(a(c)[0]).one(m,function(){a(this).replaceWith(A.children())}),e(a(c))):K.iframe?e(" "):K.html?e(K.html):ba(c)?(a(R=new Image).addClass(f+"Photo").error(function(){K.title=!1,e(Z(X,"Error").text("This image could not be loaded"))}).load(function(){var a;R.onload=null,K.scalePhotos&&(d=function(){R.height-=R.height*a,R.width-=R.width*a},K.mw&&R.width>K.mw&&(a=(R.width-K.mw)/R.width,d()),K.mh&&R.height>K.mh&&(a=(R.height-K.mh)/R.height,d())),K.h&&(R.style.marginTop=Math.max(K.h-R.height,0)/2+"px"),y[1]&&(K.loop||y[Q+1])&&(R.style.cursor="pointer",R.onclick=function(){W.next()}),n&&(R.style.msInterpolationMode="bicubic"),setTimeout(function(){e(R)},1)}),setTimeout(function(){R.src=c},1)):c&&B.load(c,K.data,function(b,c,d){e(c==="error"?Z(X,"Error").text("Request unsuccessful: "+d.statusText):a(this).contents())})},W.next=function(){!T&&y[1]&&(K.loop||y[Q+1])&&(Q=$(1),W.load())},W.prev=function(){!T&&y[1]&&(K.loop||Q)&&(Q=$(-1),W.load())},W.close=function(){S&&!U&&(U=!0,S=!1,bc(k,K.onCleanup),z.unbind("."+f+" ."+p),q.fadeTo(200,0),r.stop().fadeTo(300,0,function(){r.add(q).css({opacity:1,cursor:"auto"}).hide(),bc(m),A.remove(),setTimeout(function(){U=!1,bc(l,K.onClosed)},1)}))},W.remove=function(){a([]).add(r).add(q).remove(),r=null,a("."+g).removeData(e).removeClass(g).die()},W.element=function(){return a(P)},W.settings=d})(jQuery,document,this);
</script>
    

<?php echo $footer; ?>
