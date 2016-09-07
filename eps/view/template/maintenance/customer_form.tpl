<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      
       <a type="button" id="button-save" href="<?php echo $save; ?>"  class="btn btn-primary"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></a>
       <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
      
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>	
      </ul>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>  
       <div class="panel-body">
       <form class="form" role="form" method="post" action="<?php echo $action; ?>">
     
     <div class="well">	
              <div class="col-lg-2">
             <div class="form-group">Customer Code</div>
              <div class="form-group"><?php echo $customer_code;?></div>
         </div>
      	 <div class="col-lg-3">
              <div class="form-group">Customer</div>
              <div class="form-group"><?php echo $customer_name;?></div>
         </div>

         <div class="col-lg-4">
              <div class="form-group">City, State and Zip Code</div>
              <div class="form-group"><?php echo $customer_city;?></div>
         </div>
        
         <div class="col-lg-2">
              <div class="form-group">Phone Number</div>
              <div class="form-group"><?php echo $customer_tel;?></div>
         </div>
     </div><!---booking-type --->      
	
	
	 <ul id="customer" class="nav nav-tabs nav-justified">
            <li class="active" id = "general"><a href="#tab_general" data-toggle="tab" >General</a></li>
    		<li class="" id="contact"><a href="#tab_contact" data-toggle="tab" >Contact Info</a></li>
            <li class="" id="option"><a href="#tab_option" data-toggle="tab" >Options</a></li>
     		<li class="" id="account"><a href="#tab_account" data-toggle="tab" >Account</a></li>
            <li class="" id="lcl_dest_tab"><a href="#tab_lcl_dest" data-toggle="tab" >Sales Support</a></li>
            <li class="" id="fcl_tab"> <a href="#tab_fcl" data-toggle="tab" >EDI/email</a></li>
            <li class="" id="imports_tab"><a href="#tab_imports" data-toggle="tab" >Same</a></li>
            <li class="" id="routed_tab"><a href="#tab_routed" data-toggle="tab" >LCL</a></li>
            
            
   </ul>
   
			<div class="tab-content">
				<div class="tab-pane active" id="tab_general">
					  <div class ="tab_general">
			<div class=".col-lg-12 col-md-12 col-sm-12">
				<div class=".col-lg-4 col-md-4 col-sm-6">
					<div class ="table-responsive">
						<table >
				   		<tr><td>Code</td>
				   			<td>Same As</td>
				   			<td>National</td>
				   		</tr>
				   		<tr>
				   			<td><input type="text" value= "<?php echo $customer_code;?>" class="form-control"/></td>
				   			<td><input type="text" value= "<?php echo $customer_same;?>"class="form-control"/></td>
				   			<td><input type="text" value= "<?php echo $customer_national;?>" class="form-control"/></td>
				   		</tr>
				   		<tr><td colspan = "4">Address Info</td></tr>
				   		<tr><td colspan = "4"><input type="text" placeholder = "Name "  name="customer_name" value="<?php echo $customer_name;?>" class="form-control"></td></tr>
				   		<tr><td colspan = "4"><input type="text" name="customer_name2" value="<?php echo $customer_name2 ;?>" class="form-control"/></td></tr>
				   		<tr><td colspan = "4"><input type="text" name="customer_street" value="<?php echo $customer_street;?>" class="form-control"/></td></tr>
				   		<tr><td colspan = "4"><input type="text" placeholder = "City "  name="customer_city" value="<?php echo $customer_city;?>" class="form-control"/>
				   				<input type="text" placeholder = "State "  name="customer_state" value="<?php echo $customer_state;?>" class="form-control"/>
				   				<input type="text" placeholder = "Zip "  name="customer_zip" value="<?php echo $customer_zip;?>" class="form-control"/>
				   			</td>
				   		</tr>
				   		</table>
	   				</div>
				</div>
				<div class=".col-lg-2 col-md-2 col-sm-6">
					<div class ="table-responsive">
							  <table >
 							 
							   		<tr>
							   		<td>Status</td></tr>
							   		<tr><td >
							   		<?php if ($customer_status=='A') { ?>
							   		<input type="radio" name="customer_status" checked="checked" />Active 
							   		<?php }else { ?>
							   		<input type="radio" name="customer_status"  />Active 
							   		<?php } ?>
							   		</td></tr>
							   		<tr><td>
							   		<?php if ($customer_status=='I') { ?>
							   		<input type="radio" name="customer_status" checked="checked" />IN-Act 
							   		<?php }else { ?>
							   		<input type="radio" name="customer_status"/>IN-Act 
							   		<?php } ?>
							   		</td></tr>
							   		<tr><td>
							   		<?php if ($customer_status=='D') { ?>
							   		<input type="radio" name="customer_status" checked="checked"/>Delinqt
							   		<?php }else { ?>
							   		<input type="radio" name="customer_status"/>Delinqt 
							   		<?php } ?>
							   		</td></tr>
							   		<tr><td>
							   		<?php if ($customer_status=='P') { ?>
							   		<input type="radio" name="customer_status" checked="checked" />Prm
							   		<?php }else { ?>
							   		<input type="radio" name="customer_status"/>Prm
							   		<?php } ?>
							   		</td>
							   		</tr>
   		
   		
 							 </table>	  
 							 <br>
 							 	<table >
							   		<tr>
							   		<td>Customer Type</td></tr>
							   		<tr><td>
							   		<?php if ($customer_nvo=='true'){?>
							   		<input checked="checked" type="checkbox" />
							   		<?php }else{?>
							   		<input type="checkbox" />
							   		<?php }?>
							   		NVO </td><td><input type="text" value="<?php echo $customer_cca;?>" size ="5"> </td> </tr>
							   		<tr><td>
							   		<?php if ($customer_ff=='true'){?>
							   		<input checked="checked" type="checkbox" />
							   		<?php }else{?>
							   		<input type="checkbox" />
							   		<?php }?>
							   		F/F </td><td><input type="text" value="<?php echo $customer_fmc;?>" size ="5"> </td> </tr>
							   		<tr><td colspan = "2">
							   		<?php if ($customer_shipper=='true'){?>
							   		<input checked="checked" type="checkbox" />
							   		<?php }else{?>
							   		<input type="checkbox" />
							   		<?php }?>
							   		Prop Shipper </td></tr>
							   		<tr><td>
							   		<?php if ($customer_personal=='true'){?>
							   		<input checked="checked" type="checkbox" />
							   		<?php }else{?>
							   		<input type="checkbox" />
							   		<?php }?>
							   		Pers Eff
							   		</td>
							   		</tr>	
							   		<tr><td>
							   		<?php if ($customer_import=='true'){?>
							   		<input checked="checked" type="checkbox" />
							   		<?php }else{?>
							   		<input type="checkbox" />
							   		<?php }?>
							   		Import
							   		<td><input type="text" size ="5" value="<?php echo $customer_chb;?>"> </td> </tr>
						   		</table>
						 							 
   					</div>
   				</div>	
   				<div class=".col-lg-3 col-md-3 col-sm-6">
					<div class ="table-responsive">
						<table class = "table table-bordered">
				   			<tr>
				   			<td colspan ="4">
				   			Commission/Sales Rep Info
				   			</td>
				   			</tr>
				   			<tr><td>LCL</td><td><select name="customer_rep_lcl"> ><option size = "25"> </option></select></td>
				   			
				   			<td><select name="customer_acct_lcl">
				                  <option value="1">House Account</option>
				                  <option value="2">Account Rep</option>
				                  <option value="3">True Split</option>
				                  <option value="4">Special</option>
				                  <option value="5">Agent Routed</option>
				                  <option value="6">3 Way Split</option></select>
				            </td></tr>
				   			
				   			
				   			<tr><td>FCL</td><td><select name="customer_rep_fcl"><option size = "25"> </option></select></td>
							<td><select name="customer_acct_lcl">
				                  <option value="1">House Account</option>
				                  <option value="2">Account Rep</option>
				                  <option value="3">True Split</option>
				                  <option value="4">Special</option>
				                  <option value="5">Agent Routed</option>
				                  <option value="6">3 Way Split</option></select>
				            </td></tr>
				   			<tr><td>IMP</td><td><select name="customer_rep_imp"><option size = "25"> </option></select></td>
							<td><select name="customer_acct_imp">
				                  <option value="1">House Account</option>
				                  <option value="2">Account Rep</option>
				                  <option value="3">True Split</option>
				                  <option value="4">Special</option>
				                  <option value="5">Agent Routed</option>
				                  <option value="6">3 Way Split</option></select>
				            </td></tr>
				   			<tr><td colspan = "2"><input type="checkbox" />Copy of LCL Quotations</td><td colspan ="2"><input type="checkbox" />Copy of LCL Bookings</td>
				   		</table>
					</div>
				</div>	
   				<div class=".col-lg-3 col-md-3 col-sm-6">
					<div class ="table-responsive">
						<table class = "table table-bordered">
						<tr><td colspan ="4">Miscelaneous Info</td>
				   			</tr>
					   			<tr><td>LCL</td><td><select ><option size = "25"> </option></select></td></tr>
					   			<tr><td>FCL</td><td><select ><option size = "25"> </option></select></td></tr>
					   			<tr><td>IMP</td><td><select ><option size = "25"> </option></select></td></tr>
					   			<tr><td><input type="checkbox" />Copy of LCL Quotations</td><td><input type="checkbox" />Copy of LCL Bookings</td><tr>
					   		</table>
					</div>
				</div>
				</div>
				</div>
			    </div><!--- end tab #tab-general --->
			   
			    <div class="tab-pane" id="tab_contact" >
						<div class ="tab_contact">
							<div class=".col-lg-12 col-md-12 col-sm-12">
							<?php echo $contact_details;?>
							</div>
						</div><!--"costs -content" -->
				</div>
				
				 <div class="tab-pane" id="tab_option" >
			    		<div class="tab_option">	
			    			<div class=".col-lg-12 col-md-12 col-sm-12">
			    			<div class= "row vertical-align">
    		
    		<table class = "table table-bordered"  >
    		<tr>
    		<td valign="top">
    	<div class="table-responsive vcenter">	
	    		<table valign = "top">
	    		<tr>
	    		<td>
	    		<b>General Options</b>
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Domestic Warehousing
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Foreign Warehousing
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>No Doc Request Fax
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>No AES
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Deduct AES
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Deduct Brokerage
	    		</td>
	    		</tr>
	    		
	    		
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Rate ALL HBL's
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Unrated Proofs ONLY
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		&nbsp;
	    		</td>
	    		</tr>
	    		<tr>
	    		<td class = "required">
	    		<input type="checkbox"/>OLB Activated
	    		</td>
	    		</tr>
	    		</table>
	    </div>		
	    	<td valign="top">
	    <div class="table-responsive">	
	    			    		<table>
	    		<tr>
	    		<td>
	    		<b>LCL Options</b>
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Quote Override
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>No Quotes
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>GRI Exempt
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>No Pre-Enter Proofs
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>No Detail Collect HBL
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Seperate HBL Advises
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Show CFt on PE
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Do Not Breakdown Cargo
	    		</td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td></td>
	    		<td></td>
	    		</tr>
	    		<tr>
	    		<td >
	    		<input type="checkbox"/>ALWAYS Routed 
	    		</td>
	    		<td><input type="text" size="10"/></td>
	    		</tr>
	    		<tr><td align="right">Laden</td><td>Express</td></tr>
				<tr><td align="right">Rated <input type="text" size="3"/></td><td><input type="text" size="3"/></td></tr>
				<tr><td align="right">Un-Rated <input type="text" size="3"/></td><td><input type="text" size="3"/></td></tr>
				<tr><td align="right">Original <input type="text" size="3"/></td><td><input type="text" size="3"/></td></tr>
	    		</table>
	   </div> 			
	    	</td>
	    	<td valign="top">
	  <div class="booking-content">  	
	    	 	<table >
	    		<tr>
	    		<td>
	    		<b>FCL Options</b>
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Doc Receipts Required
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>No Quotes
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Allow Vehicles
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Routed Agent
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		&nbsp;
	    		</td>
	    		</tr>
	    		<tr><td align="right">Laden</td><td>Express</td></tr>
				<tr><td align="right">Rated <input type="text" size="3"/></td><td><input type="text" size="3"/></td></tr>
				<tr><td align="right">Un-Rated <input type="text" size="3"/></td><td><input type="text" size="3"/></td></tr>
				<tr><td align="right">Original <input type="text" size="3"/></td><td><input type="text" size="3"/></td></tr>
	    		
	    	</table>	
	   </div>
	   	<br> 
	   	</td>
	   	<td valign="top">	
	   <div class="booking-content">
	   		<table class ="box"> 		
	    		<tr>
	    		<td>
	    		<b>Import Options</b>
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>Warehouse Release
	    		</td>
	    		</tr>
	    		<tr>
	    		<td>
	    		<input type="checkbox"/>No Quotes	
	    		</td>
	    		</tr>
	    		</table>
	   </div> 		
	    	</td>
	    	<td valign="top">
	<div class="booking-content">
	    	<table class ="box" >
	    	<tr>
	    		<td>
	    		<b>Release Options</b>
	    		</td>
	    		</tr>
	    	<tr>
	    	<td>
	    	<input type="checkbox"/>Email Only
	    	</td>
	    	</tr>
	    	
    
	    	<tr>
	    		<td>
	    		Delivery Via:
	    		</td>
	    		</tr>
	    	<tr><td><input type="radio" name="viaDelivery" >U.S. Mail</td></tr>
	    	<tr><td><input type="radio" name="viaDelivery" >Express</td></tr>
	    	<tr><td><input type="radio" name="viaDelivery" >Jefferon</td></tr>
	    	<tr><td><input type="radio" name="viaDelivery" >Fedex</td></tr>
	
	    	</table>
	</div>    	
			</td>
			</tr>
			<tr>
			<td colspan="5" align="">
			    <div class= "booking-content">
    		<table>
    		<tr><td>Visitor Badge</td></tr>
    		<tr><td>Company</td><td>Name</td></tr>
    		<tr><td><input type="text" size="30"></td><td><input type="text" size="30"></td>
    		<td><input type="checkbox" />Show Customer</td>
    		<td></td>
    		<td align="right"><a class="button">Print</a></td>
    		</tr>
    		
    		</table>
    </div>
			</td>
	    	</tr>	
    		</table>
    		
    		 </div>

			    			</div>
			    		</div><!--"tab_option-content" -->   		
				</div>
				
				<div class="tab-pane" id="tab_account" >
					    <div class="tab_account">
					    	<div class=".col-lg-12 col-md-12 col-sm-12">
					    	<table><tr>
   	<td valign="top">
	  <div class="booking-content">
	    	<table class ="box" >
	    	<tr>
	    		<td>
	    		<b>Status</b>
	    		</td>
	    		</tr>
	    	
	    	<tr><td><input type="radio" name="viaDelivery" >Active</td></tr>
	    	<tr><td><input type="radio" name="viaDelivery" >In-Active</td></tr>
	    	<tr><td><input type="radio" name="viaDelivery" >Delinquent</td></tr>
	    	<tr><td><input type="radio" name="viaDelivery" >Perm</td></tr>
	
	    	</table>
	</div>
	<br>
	  <div class="booking-content">
		<table><tr>
			</td>
			<td>EIN Number</td><td><input type="text" size="10"/></td>
			</tr><tr>
			<td>Label</td><td><input type="text" size="10"/></td>
			</tr><tr>
			<td><input type="checkbox"/></td><td>Acct Transfer</td>
			</tr><tr>
			<td>Routing Agent Info</td><td><select /></td>
			 </tr>
		 </table>
	 </div>
	 </td>
	<td valign="top">
	 <div class="booking-content">
	 <table><tr>
			
			<td><b>Special Rates</b></td>
			</tr>
			<tr><td>
			<div class="booking-content">
				<table>
				<tr><td>CoLoad Adjustment</td></tr>
				<tr><td><input type="radio" name="CoLoadAdj" >Discount</td></tr>
		    	<tr><td><input type="radio" name="CoLoadAdj" >Premium</td></tr>
		    	<tr><td><input type="radio" name="CoLoadAdj" >None</td></tr>
		    	</table>
			</div>
			<br>
			<div class="booking-content">
				<table>
				<tr><td>Adjustment Type</td></tr>
				<tr><td><input type="radio" name="AdjustType" >Percent</td></tr>
		    	<tr><td><input type="radio" name="AdjustType" >Dollar</td></tr>
		    	<tr><td><input type="radio" name="AdjustType" >None</td></tr>
		    	</table>
			</div>
			</td>
			<td valign = "top">
			<table>
				<tr><td>Adjust Amount</td><td><input type="text" Size="5"/></td> </tr>
				<tr><td>AES Filing</td><td><input type="text" Size="5"/></td> </tr>
				<tr><td>Agent Fee</td><td><input type="text" Size="5"/></td> </tr>
				<tr><td>No Chassis</td><td><input type="checkbox" /></td> </tr>
			</table>
			</td>
			 </tr>
		 </table>
	 </div>
	 </td>
	 <td valign="top">
	 <div class="booking-content">
	 <table><tr>			
			<td><b>LCL Quotes / Bookings</b></td></tr>
			<tr><td>
			<div class="booking-content">
				<table>
				<tr><td colspan="2" align="center">Recent</td></tr>
				<tr><td>Quotes</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Bookings</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Effective</td><td><input type="text" size="5"/></td></tr>
				</table>
			</div>
			<br>
			<div class="booking-content">
				<table>
				<tr><td colspan="2" align="center">Historical</td></tr>
				<tr><td>Quotes</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Bookings</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Effective</td><td><input type="text" size="5"/></td></tr>
				</table>
			</div>
			
	 </tr>
	 </table>
	 </div>
	 </td> 
	 	 <td valign="top">
	 <div class="booking-content">
	 <table><tr>			
			<td><b>FCL Quotes / Bookings</b></td></tr>
			<tr><td>
			<div class="booking-content">
				<table>
				<tr><td colspan="2" align="center">Recent</td></tr>
				<tr><td>Quotes</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Bookings</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Effective</td><td><input type="text" size="5"/></td></tr>
				</table>
			</div>
			<br>
			<div class="booking-content">
				<table>
				<tr><td colspan="2" align="center">Historical</td></tr>
				<tr><td>Quotes</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Bookings</td><td><input type="text" size="5"/></td></tr>
				<tr><td>Effective</td><td><input type="text" size="5"/></td></tr>
				</table>
			</div>
			
	 </tr>
	 </table>
	 </div>
	 	 <td valign="top">
		 <div class="booking-content">
		 <table>
		 <tr>			
				<td><b>Data Entry</b></td></tr>
				<tr><td>Entry</td><td><input type="text" size="5"/></td><td><input type="text" size="3"/></td>
				<tr><td>Last Edit</td><td><input type="text" size="5"/></td><td><input type="text" size="3"/></td>
		 </tr>
		 </table>
		 </div>
		 <br>
		 <div class="booking-content">
		 <table>
		 <tr><td><b>Other</b></td></tr>
		 <tr><td>Split</td><td><select /></td></tr>
		 <tr><td>OTI ID</td><td><input type="text" size="5"/></td></tr>
		 <tr><td><input type="checkbox"/>Add-On</td><td><input type="text" size="5"/></td></tr>
		 <tr><td><input type="radio"/>Pre-Paid</td></tr>
		 <tr><td><input type="radio"/>Collect</td></tr>
		 <tr><td><input type="radio"/>Both</td></tr>
		 </table>
		 </div>
		 
	 </td>
	</tr>  
	<tr>
	<td  colspan ="5" valign="top">
		 <div class="booking-content">
		 <table>
		 <tr>
		 <td colspan ="5"><b>Credit Info / Documents</b></td>	
		 </tr>
		 <tr valign="top">
		 <td>Limit</td>
		 <td>Days</td>
		 <td>Delinquent Since</td>
		 <td>Credit App</td>
		 <td>App Appr</td>
		 <td>CC Agmt</td>
		 <td>CTPAT Recd</td>
		 <td>POA Rcvd</td>
		 </tr>
		 <tr>
		 <td><input type="text" size="5" /></td>
		 <td><input type="text" size="5" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 </tr>
		 <tr>
		 <td></td>
		 <td></td>
		 <td></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 <td><input type="text" size="10" /></td>
		 
		 </tr>
		 </table>
		 </div>
	</tr>	
	</table>
					    	</div>
					    </div><!--"tab_account-content" -->   		
				</div>
				
				<div class="tab-pane" id="tab_lcl_dest" >
					    <div class="tab_lcl_dest">
					    	<div class=".col-lg-12 col-md-12 col-sm-12">
					    	test4
					    	</div>
					    </div><!--"tab_lcl_dest-content" -->   		
				</div>
				<div class="tab-pane" id="tab_fcl" >
			   			<div class="tab_fcl">
			   				<div class=".col-lg-12 col-md-12 col-sm-12">
			   				test5
			   				</div>
			   			</div><!--"tab_fcl-content" -->   		
				</div>
				
				<div class="tab-pane" id="tab_imports" >
			    		<div class="tab_imports">
			    			<div class=".col-lg-12 col-md-12 col-sm-12">
			    			test6
			    			</div>
			    		</div><!--"tab_imports-content" -->   		
				</div>
				<div class="tab-pane" id="tab_routed" >
			    		<div class="tab_routed">
			    			<div class=".col-lg-12 col-md-12 col-sm-12">
			    			test7
			    			</div>
			    		</div><!--"tab_imports-content" -->   		
				</div>
				
						
			</div><!-- end tab content-->		
			
		</div><!-- end panel body-->	
		 </form>
	</div><!-- end panel-->
</div><!-- end container--> 
</div>   
       
<?php echo $footer; ?>