		<div class ="row">
		  <div class="form-group required">
			<div class="col-sm-4" >
			 <a  href="<?php echo $customersearch; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> 
			<?php if ($customer) { ?>
			<?php echo $customer; ?>
	<?php } ?>	
			<input type="hidden" name="customer" value="<?php echo $customer; ?>" id="customer"  />	
				</div>
				<div class="col-sm-4" >
	<?php if ($ActiveSession =='Booking') { ?>
	<?php if ($bookingnumber) { ?>
 			<input  type="text" disabled = "disabled" placeholder="Booking #" name="booking_no"  maxlength="6" value="<?php echo $bookingnumber; ?>"   class="form-control" />
	<?php } else { ?>         
			<input  type="text" placeholder="Booking #" name="booking_no"  maxlength="6" value="<?php echo $bookingnumber; ?>"  class="form-control"  />
	<?php } ?>
	<?php } ?>
	
			</div>	
			<div  class="col-sm-4" >
 	<?php if ($quotenumber || $bookingnumber) { ?>
 			<input  type="text" disabled = "disabled" placeholder="Quote #" name="quotenumber"  maxlength="6" value="<?php echo $quotenumber; ?>"   class="form-control" />
	<?php } else { ?>         
			<input  type="text" placeholder="Quote #" name="quotenumber"  maxlength="6" value="<?php echo $quotenumber; ?>"  class="form-control"  />
	<?php } ?>
			</div>
		  </div>	
		</div>
	
	<?php if ($routedcargo == "true" || $custuserouted=="true") { ?>
	
		  <div class="form-group">
          	<label class="col-sm-2 control-label" for="customerName"><?php echo $entry_customerName; ?></label>
	          <div class="col-sm-10">
	            <input type="text" name="customerName" value="<?php echo $customerName; ?>" id="customerName" class="form-control" />
	          </div>
          </div>
          
          <div class="form-group">
          	<label class="col-sm-2 control-label" for="customerSignator">Shipper/</label>
          	<div class="col-sm-10">
            <input type="text" id="customerSignator" name="customerSignator" value="<?php echo $customerSignator ;?>" class="form-control" />
    		</div>
    <?php if ($ActiveSession == "Booking") { ?> 
    	<?php if (isset($email_to_send_shipper) && !empty($email_to_send_shipper)) { ?>	
    		 <?php foreach ($email_to_send_shipper as $email) { ?>
    		 		 <div class="form-group">
					    <div class="row col-sm-10 col-sm-offset-2">
					         <div class="input-group">
						      <input type="text" name="shippercontact<?php echo $email['customer_id'] ?>" placeholder = "Contact" value="<?php echo $email['contact'] ?>" id="shippercontact" class="form-control" />
							  <span class="input-group-btn">
							  <a type="button" id="button_contact_remove" data-toggle="tooltip" href="<?php echo $remove_contact; ?>&customer_id=<?php echo $email['customer_id'] ?>" title="<?php echo $button_contact_remove; ?>" data-loading-text="<?php echo $text_contact_remove; ?>" class="btn btn-primary">
							  <i class="fa fa-minus"></i>
							  </a>
							  
							   <?php if (isset($customer) && !empty($customer)) { ?>	
							  <a data-toggle="modal" onclick="ContactRoutedModal('<?php echo $customer; ?>');"   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
							  <?php }else{ ?>	
							   <a   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
							 
							  <?php } ?>
						      </span>
							  
				            </div>
			            </div>
			          </div>
			         
			          <div class="form-group">   
			             <div class="row col-sm-10 col-sm-offset-2">
				             <input type="text" readonly="readonly"  name="shipperemail<?php echo $email['customer_id'] ?>" value="<?php echo $email['email'] ?>" class="form-control" />
				         </div>
			          </div>
    		  <?php } ?>
    	<?php } else {?>	
    				 <div class="form-group">
					    <div class="row col-sm-10 col-sm-offset-2">
					         <div class="input-group">
						      <input type="text" name="" placeholder = "Contact" value="" id="shippercontact" class="form-control" />
							  <span class="input-group-btn">
							  <a type="button" id="button_contact_remove" data-toggle="tooltip" href="" title="<?php echo $button_contact_remove; ?>" data-loading-text="<?php echo $text_contact_remove; ?>" class="btn btn-primary">
							  <i class="fa fa-minus"></i>
							  </a>
							  
							   <?php if (isset($customer) && !empty($customer)) { ?>	
							  <a data-toggle="modal" onclick="ContactRoutedModal('<?php echo $customer; ?>');"   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
							  <?php }else{ ?>	
							   <a   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
							 
							  <?php } ?>
						      </span>
							  
				            </div>
			            </div>
			          </div>
			         
			          <div class="form-group">   
			             <div class="row col-sm-10 col-sm-offset-2">
				             <input type="text" readonly="readonly" name="shipperemail" id="shipperemail" value="" class="form-control" />
				         </div>
			          </div>
    	
    	 <?php } ?>  
    <?php } ?>
       
           </div>
          <div class="form-group">
          <label class="col-sm-2 control-label" for="customerConsignee">Consignee/</label>
          <div class="col-sm-10">
           <input type="text" id="customerConsignee" name="customerConsignee" value="<?php echo $customerConsignee ;?>" class="form-control" />
    		</div>
          </div>
          
          <div class="form-group">
          <label class="col-sm-2 control-label" for="customerNotify">Notify/</label>
          <div class="col-sm-10">
           <input type="text" id="customerNotify" name="customerNotify" value="<?php echo $customerNotify ;?>" class="form-control" />
    		</div>
          </div>
          
           
           
		 
<?php if (isset($email_to_send) && !empty($email_to_send)) { ?>	
     <?php foreach ($email_to_send as $email) { ?>
       	  <div class="form-group">
		    <div class="row col-sm-10 col-sm-offset-2">
		         <div class="input-group">
			      <input type="text" name="customercontact<?php echo $email['customer_id'] ?>" placeholder = "Contact" value="<?php echo $email['contact'] ?>" id="customercontact" class="form-control" />
				  <span class="input-group-btn">
				  <a type="button" id="button_contact_remove" data-toggle="tooltip" href="<?php echo $remove_contact; ?>&customer_id=<?php echo $email['customer_id'] ?>" title="<?php echo $button_contact_remove; ?>" data-loading-text="<?php echo $text_contact_remove; ?>" class="btn btn-primary">
				  <i class="fa fa-minus"></i>
				  </a>
				  
				   <?php if (isset($customer) && !empty($customer)) { ?>	
				  <a data-toggle="modal" onclick="ContactModal('<?php echo $customer; ?>');"   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				  <?php }else{ ?>	
				   <a   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				 
				  <?php } ?>
			      </span>
				  
	            </div>
            </div>
          </div>
         
          <div class="form-group">   
             <div class="row col-sm-10 col-sm-offset-2">
	             <input type="text" readonly="readonly" value="<?php echo $email['email'] ?>"  name="customeremail<?php echo $email['customer_id'] ?>"  class="form-control" />
	         </div>
          </div>
		        
	 <?php } ?>	
	 
	 
<?php } else { ?>
         <div class="form-group">
            <div class="row col-sm-10 col-sm-offset-2">
		         <div class="input-group">
			      <input type="text" name="customercontact" readonly="readonly" placeholder = "Contact" value="<?php echo $customercontact; ?>" id="customercontact" class="form-control" />
				  
				  <span class="input-group-btn">
				   <?php if (isset($customer) && !empty($customer)) { ?>	
				  <a data-toggle="modal" onclick="ContactModal('<?php echo $customer; ?>');"  id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				  <?php }else{ ?>	
				   <a   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				 
				  <?php } ?>
			      </span>
	            </div>
             </div>
          </div>
          
<?php } ?>
		
		
		
		
          
<?php }else { ?>
		
        <div class="form-group">
          <label class="col-sm-2 control-label" for="customerName"><?php echo $entry_customerName; ?></label>
          <div class="col-sm-10">
            <input type="text" name="customerName"  value="<?php echo $customerName; ?>" id="customerName" class="form-control" />
          </div>
        </div>
          
        <div class="form-group">
         <label class="col-sm-2 control-label" for="customerAddress1"><?php echo $entry_customerAddress1; ?></label>
         <div class="col-sm-10">
           <input type="text" name="customerAddress1" value="<?php echo $customerAddress1; ?>" id="customerAddress1" class="form-control search" />
         </div>
        </div>
          
        <div class="form-group">
          <label class="col-sm-2 control-label" for="customerAddress2"><?php echo $entry_customerAddress2; ?></label>
          <div class="col-sm-10">
            <input type="text" name="customerAddress2" value="<?php echo $customerAddress2; ?>" id="customerAddress2" class="form-control" />
          </div>
        </div>
        
        <div class="form-group ">
        
         	<div class="row col-lg-12 col-md-12 col-sm-12 pull-right">
	         	<label class="col-sm-0 control-label"></label>
	         	<div class="row col-sm-8"><input type="text" name="customerCity" placeholder="City" value="<?php echo $customerCity; ?>" id="customerCity" class="form-control" /></div>
		        <div class="row col-sm-3"><input type="text" name="customerState" placeholder="ST" value="<?php echo $customerState; ?>" id="customerState" class="form-control" /></div>
		        <div class="row col-sm-4"><input type="text" name="customerZip" placeholder="Zip" value="<?php echo $customerZip; ?>" id="customerZip" class="form-control" /></div>
		       	
		     
	         </div>
        </div>
        
      <div id="Contacts" >
       <?php if (isset($email_to_send) && !empty($email_to_send)) { ?>	
       		 <?php foreach ($email_to_send as $email) { ?>
       	  <div class="form-group">
		    <div class="row col-sm-10 col-sm-offset-2">
		         <div class="input-group">
			      <input type="text" name="<?php echo $email['customer_id'] ?>" disabled="disabled" placeholder = "Contact" value="<?php echo $email['contact'] ?>" id="customercontact" class="form-control" />
				  <span class="input-group-btn">
				  <a type="button" id="button_contact_remove" data-toggle="tooltip" href="<?php echo $remove_contact; ?>&customer_id=<?php echo $email['customer_id'] ?>" title="<?php echo $button_contact_remove; ?>" data-loading-text="<?php echo $text_contact_remove; ?>" class="btn btn-primary">
				  <i class="fa fa-minus"></i>
				  </a>
				   <?php if (isset($customer) && !empty($customer)) { ?>	
				  <a data-toggle="modal" onclick="ContactModal('<?php echo $customer; ?>');"  id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				  <?php }else{ ?>	
				   <a   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				 
				  <?php } ?>	
			      </span>
				  
	            </div>
            </div>
          </div>
         
          <div class="form-group">   
             <div class="row col-sm-10 col-sm-offset-2">
	             <input type="text" readonly="readonly" value="<?php echo $email['email'] ?>" class="form-control" />
	         </div>
          </div>
		        
		    
          <?php }  ?>	
            <?php } else { ?>	
		      <div class="form-group">   
             <div class="row col-sm-10 col-sm-offset-2">
              <div class="input-group">
			      <input type="text" disabled="disabled" placeholder = "Contact"   class="form-control" />
				  <span class="input-group-btn">
				  
				  <?php if (isset($customer) && !empty($customer)) { ?>	
				  <a data-toggle="modal" onclick="ContactModal('<?php echo $customer; ?>');"  id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				  	<?php }else{ ?>	
				   <a   id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>
				 
				  <?php } ?>
			      </span>
				  
	            </div>
	         </div>
          </div>
        <?php } ?>  
        </div>	<!-- End of contacts -->
        
      <?php } ?>  
 		    <div id="telephone" name="telephone" class="form-group">   
             <div class="row col-sm-10 col-sm-offset-2">
	             <input type="text" name="custtelephone" placeholder = "Telephone" value = "<?php echo $custtelephone ?>" class="form-control" />
		      </div>
        	</div>
        	
        	

   <!-- Modal -->
  <div class="modal fade" id="myModalRouted" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog custom-class">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Add Shipper Contacts with Agent for a Routed Cargo</h4>
        </div>
		        <div class="modal-body" >
		          <div class="row header contact">
					<div class="row" id="customer_routed_contacts" >
						<div class=".col-lg-12 col-md-12 col-sm-6" >
							<table id="shipper_contacts" class="table table-bordered">
							<thead>
								<tr>
									<td>Agent Contact</td>
									<td>Total Used</td>
									
									<td></td>
									<td>Shipper Company</td>
									<td>Shipper Contact</td>
									<td>Shipper Email</td>
									<td>Total Used</td>
									<td>Last Used</td>
								</tr>
							</thead>
							<tbody>
								<?php if(isset($contactlist_routed)) { ?>
			
				 				<?php foreach ($contactlist_routed as $contact) {?>
				 				<tr class = "customer_contacts_detail">
									
									<td class="txt-contact"><?php echo $contact['shipper_company']; ?></td>
									
									<td class="txt-contact"><?php echo $contact['shipper_company']; ?></td>
									<td class="txt-contact"><?php echo $contact['shipper_company']; ?></td>
									<td class="txt-contact"><?php echo $contact['shipper_company']; ?></td>
									<td class="txt-contact"><?php echo $contact['shipper_company']; ?></td>
								<tr>
								<?php } ?>
								<tr>
								
							<?php } ?>
							</tbody>
							</table>
					    </div>
							
						
						
					  </div><!-- end row -->
					 
					</div> <!-- end row  header contact -->
					
				</div>  <!-- end modal body -->
			 
        
        <div class="modal-footer">
        <a type="button" href="<?php echo $data['contactadd']; ?>" class="btn btn-primary">Add a New Contact</a>
          <a type="button" href="<?php echo $data['contactaddshipper']; ?>" class="btn btn-primary">Add a New Shipper</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Finished</button>
          
        </div>
        
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->          

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none" >
    <div class="modal-dialog custom-class">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Add Contacts</h4>
        </div>
        <div class="modal-body">
          <div class="row header contact">
			<div class="col-lg-12" >
			<div class="table">
			<div class=".col-lg-12 col-md-12 col-sm-6" >
			<b><i>Multiple Contacts </b></i><div class="form-group"><label class="radio-inline">
			<input type="radio" name="multi_contact" id="multi_yes"> Yes</label>  
			<label class="radio-inline" for="multi_no"><input type="radio" name="multi_contact" id="multi_no" checked="checked"> No</label>
			 </div>
			 </div>
			 <div class="row" >
			<table id="customer_contacts" class="table table-bordered">
			<thead>
				<tr>
					<td></td>
					<td>First Name</td>
					<td>Last Name</td>
					<td>Email Address</td>
					<td>Phone Number</td>
					<td>Total</td>
					<td>Last</td>
				</tr>
			</thead>
			<tbody >
			
			 <?php if(isset($contactlist)) { ?>
			
 				<?php foreach ($contactlist as $contact) {?>
 				<tr class = "customer_contacts_detail">
					<?php foreach($contact['action'] as $action) { ?>
					<td>
					<a  id="closemodal" type="button" class="btn btn-primary close"  onclick="ContactAdd('<?php echo $contact['firstname']; ?> <?php echo $contact['lastname']; ?>','<?php echo $contact['email']; ?>','<?php echo $contact['customer_id']; ?>');" data-toggle="tooltip"  title="<?php echo $action['text']; ?>"  ><i class="fa fa-plus"></i></a>
					<a  id="closemodal2" type="button" href="<?php echo $action['edit'];?>" class="btn btn-info close"  onclick="$('#myModal').modal('hide')" data-toggle="tooltip" title="Edit this Contact" ><i class="fa fa-user"></i></a>
					</td>
					<?php } ?>
					<td class="txt-contact"><?php echo $contact['firstname']; ?></td>
					<td class="txt-contact"><?php echo $contact['lastname']; ?></td>
					<td class="txt-contact"><?php echo $contact['email']; ?></td>
					<td class="txt-contact"><?php echo $contact['phone']; ?></td>
					<td class="txt-contact"><?php echo $contact['total']; ?></td>
					<td class="txt-contact"><?php echo $contact['last']; ?></td>
				<tr>
				<?php } ?>
				<tr>
				
			<?php } ?>
			
			</tbody>
			 <div class="row" >
			 <table class="table table-bordered">		
			 
			 </table>
			 </div><!-- end row -->
			</div> 
			 </div>  
			 </div> 
        </div>
        <div class="modal-footer">
          <a type="button" href="<?php echo $data['contactadd']; ?>" class="btn btn-primary">Create New Contact</a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Finished</button>
          
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->         

<script type="text/javascript">$("input[name='custtelephone']").change(function(){var custtelephone = $("#custtelephone").val();	
	$('input[name=\'custtelephone\']').val(custtelephone);	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custtelephone', 'value':custtelephone});	
	
	});

</script>

<script type="text/javascript">$(document).ready(function() {
	 shortcut.add("Shift+6",function() {
		var customer_object = <?php echo json_encode($customer_object); ?>;
		if (typeof customer_object == 'undefined'){	
			alert("No Previous Customer information is avaiable!");
			var customer_object=null;
			var input_customer = null;
			var input_customerName = null;
			var input_customerAddress1 = null;
			var input_customerCity = null;
			var input_customerState = null;
			var input_customerZip = null;
			var input_customercontact = null;
			var input_custtelephone = null;
			var input_custemail = null;
			var input_custfax = null;
			
		} else {
			
			var input_customerdetail = customer_object["customerdetail"];
			var input_customer = customer_object["customer"];
			var input_customerName = customer_object["customerName"];
			var input_customerAddress1 = customer_object["customerAddress1"];
			var input_customerCity = customer_object["customerCity"];
			var input_customerState = customer_object["customerState"];
			var input_customerZip = customer_object["customerZip"];
			var input_customercontact = customer_object["customercontact"];
			var input_custtelephone =customer_object["custtelephone"];
			var input_custemail = customer_object["custemail"];
			var input_custfax = customer_object["custfax"];
		
		}
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'test_hotkey', 'value':customer_object});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer_code', 'value':input_customer});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer', 'value':input_customer});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerName', 'value':input_customerName});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress1', 'value':input_customerAddress1});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerCity', 'value':input_customerCity});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerState', 'value':input_customerState});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerZip', 'value':input_customerZip});
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail','value':input_customerdetail});
		
		$('input[name=\'customerName\']').val(input_customerName);
		$('input[name=\'customerAddress1\']').val(input_customerAddress1);
		$('input[name=\'customerCity\']').val(input_customerCity);
		$('input[name=\'customerState\']').val(input_customerState);
		$('input[name=\'customerZip\']').val(input_customerZip);
		$('input[name=\'customercontact\']').val(input_customercontact);
		$('input[name=\'custtelephone\']').val(input_custtelephone);
		$('input[name=\'custemail\']').val(input_custemail);
		
		
		ContactModal('<?php echo $customer_object->customer ?>');	
	});

	});
	//--></script> 
	
<script type="text/javascript">$(document).ready(function() {
	
		var ActiveSession ='<?php echo $ActiveSession ?>';
		var load_contacts ='<?php echo $load_contacts ?>';
		var Customer = '<?php echo $customer ?>';
		var load_Customer = '<?php echo $customer ?>';
		var email_to_send = '<?php echo $email_to_send ?>';
		
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'load_contacts', 'value':load_contacts});
		
		if (typeof ActiveSession == 'undefined'){ var ActiveSession = 'Booking';	} 
		if (typeof load_contacts == 'undefined'){ var load_contacts = 'No';	}; if (window['load_contacts'] != undefined){ var load_contacts = 'No';	}; 
		if (typeof Customer == 'undefined'){ load_Customer = 'No';	}; if (window['Customer'] == undefined){ load_Customer = 'No';	}; 
		if (typeof email_to_send != 'undefined' && email_to_send.length >0){var load_contacts = 'No';} 
			
			
		if (ActiveSession === "Booking"){
			var booking_no = '<?php echo $bookingnumber ?>';
			if (typeof booking_no != 'undefined' && booking_no.length > 0){ load_Customer = 'No';	} 
			if(load_contacts!='No'){	
				
				var url_reload= 'index.php?route=service/booking/insertContacts&token=<?php echo $token; ?>&customer_id=';
				
					$(window).load(function(){    $('#myModal').modal('show');		});
				
			} else {
				var url_reload= 'index.php?route=service/booking/insert&token=<?php echo $token; ?>&customer_id=';
			}
		} else if (ActiveSession === "Quote"){
			var quote_no = '<?php echo $quotenumber ?>';
			if (typeof quote_no != 'undefined' && quote_no.length > 0 ){ 
				load_Customer = 'No';	
				} 
			if(load_contacts!='No'){
				
				var url_reload= 'index.php?route=service/quotations/insertContacts&token=<?php echo $token; ?>&customer_id=';
				
					$(window).load(function(){    $('#myModal').modal('show');		});
				
			} else {
				
				var url_reload= 'index.php?route=service/quotations/insert&token=<?php echo $token; ?>&customer_id=';
				
			}
		}

	// Single Value Selection	
		
		
		$("#customerName").on("keyup", function(event) {
			var query = $("#customerName").val();
	        $.get('index.php?route=service/customer/getBookingCustomer&token=<?php echo $token; ?>&filter_custkey='+ query, function(data){
		    	list = JSON.parse(data);
			});
			if ($("#customerName").val().length > 2){
				if (list.length == 1){
					
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'load_contacts', 'value':'No'});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'email_to_send', 'value':''});
					
					//$('input[name=\'customerName\']').val(list[0].customerName);
					$('input[name=\'customerAddress1\']').val(list[0].customerAddress1);
					$('input[name=\'customerCity\']').val(list[0].customerCity);
					$('input[name=\'customerState\']').val(list[0].customerState);
					$('input[name=\'customerZip\']').val(list[0].customerZip);
					$('input[name=\'custtelephone\']').val(list[0].custtelephone);

					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer_code', 'value':list[0].CustCode});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer', 'value':list[0].CustCode});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerName', 'value':list[0].CustName1});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress1', 'value':list[0].CustStreet});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerCity', 'value':list[0].CustCity});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerState', 'value':list[0].CustState});
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerZip', 'value':list[0].CustZip});	
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'CustLastR', 'value':list[0].CustLastR});	
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custuserouted', 'value':list[0].custuserouted});	
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custtelephone', 'value':list[0].custtelephone});	
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'CustFF', 'value':list[0].CustFF});	
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail','value':(list[0].CustName1+'\n'+list[0].CustStreet+'\n'+list[0].CustCity+','+list[0].CustState+' '+list[0].CustZip)});
					
					var routed = list[0].custuserouted;
					
					if(routed=='true'){
	
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'routedcargo','value':'true'});
						$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'Bkcold','value':'C'});
						//$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'load_contacts','value':'true'});
						
						//CustomerRouted(list[0].CustCode);
					} 
					ContactModal(list[0].CustCode);
				
				};
			};
		});	
		
		
		
     // Customer
        $('input[name=\'customerName\']').autocomplete({
        	'source': function(request, response) {
        		$.ajax({
        			url: 'index.php?route=service/customer/getBookingCustomer&token=<?php echo $token; ?>&filter_custkey=' +  encodeURIComponent(request),
        			dataType: 'json',			
        			success: function(json) {
        				response($.map(json, function(item) {
        					
        					return {
        					label: item['CustName1'] + ' | ' + item['CustStreet'] +' | ' + item['CustState'] + ' | ' + item['CustZip'],
    						value: item['CustCode'],
    						value2: item['custkey'],
    						value3: item['CustName1'],
    						value4: item['CustName2'],
    						value5: item['CustStreet'],
    						value6: item['CustCity'],
    						value7: item['CustState'],
    						value8: item['CustZip'],
    						value9: item['CustLastR'],
    						value10: item['custuserouted'],
    						value11: item['custtelephone'],
    						value12: item['CustFF']
    						}
        				}));
        			}
        		});
        	},
        	'select': function(item) {
				//window.location = url_reload+item['value'];
				if (item['value10']=='true'){
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'routedcargo','value':'true'});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'Bkcold','value':'C'});
					}
				$('#customer').val(item['value']);
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'load_contacts', 'value':'No'});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'email_to_send', 'value':''});
				$('input[name=\'customerName\']').val(item['value3']);
				$('input[name=\'customerAddress1\']').val(item['value5']);
				$('input[name=\'customerCity\']').val(item['value6']);
				$('input[name=\'customerState\']').val(item['value7']);
				$('input[name=\'customerZip\']').val(item['value8']);
				$('input[name=\'custtelephone\']').val(item['value11']);
				
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer_code', 'value':item['value']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customer', 'value':item['value']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerName', 'value':item['value3']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerAddress1', 'value':item['value5']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerCity', 'value':item['value6']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerState', 'value':item['value7']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerZip', 'value':item['value8']});

				var customerdetail = item['value3']+'\n'+ item['value5']+'\n'+item['value6']+', '+ item['value7']+ ' '+item['value8']+'\n';
				
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerdetail','value':customerdetail});

				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'CustLastR', 'value':item['value9']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custuserouted', 'value':item['value10']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custtelephone', 'value':item['value11']});
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'CustFF', 'value':item['value12']});	

				ContactModal(item['value']);
				
				 return;
        	}
          });
	});	

			function reload() {
			    //window.location = location;
			    window.location= 'http://10.0.0.92/v2/lcl/index.php?route=service/quotations/insert&token=912ce4d629d945ec6c73e6a22adb8b48';
				
			}

			
					
			function ContactModal(x){	
				$.get('index.php?route=sale/customer/getContactList&token=<?php echo $token; ?>&customer='+ x , function(data){
				contact_list = JSON.parse(data);

				var i = 0;
				var html2='';
				var email_to_send = '<?php echo $email_to_send ?>';

				if(!$('#customer_contacts').hasClass("done")) { $('#customer_contacts').addClass("done");
					
				for (i = 0; i < contact_list.length; i++) {		
					
					html2 += '<tr class = "customer_contacts_detail">';
					html2 += '<td><a  id="closemodal" type="button" class="btn btn-primary close"  ';
					html2 += 'onclick="ContactAdd(\'' + contact_list[i].firstname + ' '+ contact_list[i].lastname +'\',\'' + contact_list[i].email + '\',\''+ contact_list[i].customer_id + '\' );" ';
					html2 += 'data-toggle="tooltip"  title="' + contact_list[i].action[0].text+'"  >';
					html2 += '<i class="fa fa-plus"></i></a>';
					html2 += '<a  id="closemodal2" type="button" href="' + contact_list[i].action[0].edit+'" class="btn btn-info close"  ';
					html2 += 'onclick="$(\'#myModal\').modal(\'hide\')" data-toggle="tooltip" title="Edit this Contact" >';
					html2 += '<i class="fa fa-user"></i></a></td>';
					
					
					html2 += '<td class="txt-contact">' + contact_list[i].firstname+'</td>';
					html2 += '<td class="txt-contact">' + contact_list[i].lastname+'</td>';
					html2 += '<td class="txt-contact">' + contact_list[i].email+'</td>';
					if (contact_list[i].phone == null){contact_list[i].phone = '';}
					html2 += '<td class="txt-contact">' + contact_list[i].phone+'</td>';
					html2 += '<td class="txt-contact">' + contact_list[i].total+'</td>';
					if (contact_list[i].recent == null){contact_list[i].recent = '';}
					html2 += '<td class="txt-contact">' + contact_list[i].recent+'</td>';
					html2 += '</tr>';
					
				};

				if ($('input[name=\'custtelephone\']').length < 1){
				$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'custtelephone', 'value':contact_list[0].phone});
				$('input[name=\'custtelephone\']').val(contact_list[0].phone);
				};
				$('#customer_contacts tbody').append(html2);

				};		
				
			});					
			$('#myModal').modal('show');
		}

			
//--></script> 
 <script type="text/javascript"><!--
			function ContactRoutedModal(x){	
				$.get('index.php?route=sale/customer/getShipperList&token=<?php echo $token; ?>&customer='+ x  , function(data){
					contact_routed_list = JSON.parse(data);
					$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'contact_routed', 'value':contact_routed_list});

					var i = 0;
					var html3='';
					if(!$('#shipper_contacts').hasClass("done")) { $('#shipper_contacts').addClass("done");

						for (i = 0; i < contact_routed_list.length; i++) {	
		
							html3+='<tr>';
							html3+='<td>' + contact_routed_list[i].customer_agent+'</td>';
							html3+='<td></td>';
							
							//html3+='<td><a type="button" data-toggle="tooltip" title="<?php echo $button_add_shipper; ?>" onclick="$(\'#myModalRouted\').modal(\'hide\');" class="btn btn-primary"><i class="fa fa-plus"></i></a></td>';
							
							html3+='<td><a type="button" data-toggle="tooltip" title="<?php echo $button_add_shipper; ?>" onclick="ContactRoutedAdd(\''+contact_routed_list[i].customer_agent+'\',\''+contact_routed_list[i].customer_agent_email+'\',\''+contact_routed_list[i].customer_agent_id+'\',\''+contact_routed_list[i].shipper_contact+'\',\''+contact_routed_list[i].shipper_email+'\',\''+contact_routed_list[i].shipper_id+'\',\''+contact_routed_list[i].shipper_company +'\');" class="btn btn-primary"><i class="fa fa-plus"></i></a></td>';
							html3+='<td>' + contact_routed_list[i].shipper_company+'</td>';
							html3+='<td><a onclick="getShipper(\''+ contact_routed_list[i].shipper_id+'\')">' + contact_routed_list[i].shipper_contact+'</a></td>';
							html3+='<td>' + contact_routed_list[i].shipper_email+'</td>';
							html3+= '<td class="txt-contact">' + contact_routed_list[i].total+'</td>';
							if (contact_routed_list[i].recent == null){contact_routed_list[i].recent = '';}
							html3+= '<td class="txt-contact">' + contact_routed_list[i].recent+'</td>';
							html3+='</tr>';
						};
						
						$('#shipper_contacts tbody').append(html3);
					};	
				});
				$('#myModalRouted').modal('show');
			}	

			function getShipper(x){
				var url_shipper = 'index.php?route=sale/customer/edit_shipper&token=<?php echo $token; ?>&Use=Booking&shipper=true&shipper_id=';
				//alert(url_shipper+x);
				window.location=url_shipper+x;
				
				}
//--></script> 		

<script type="text/javascript"><!--
	$(document).ready(function() {
		var url_booking = 'index.php?route=service/customer/getBookingRecord&token=<?php echo $token; ?>&filter_booking_id=';
		var url_booking_update =  'index.php?route=service/booking/update&token=<?php echo $token; ?>&booking_no='; 
		var booking_query = $('input[name=\'booking_no\']').val();
			
			$('input[name=\'booking_no\']').autocomplete({
				
				'source': function(request, response) {
					$.ajax({url: url_booking +  encodeURIComponent(request),
							dataType: 'json',
							success: function(json) {
								response($.map(json, function(item) {
									return {
										label: item['booking_no']  + ' | ' + item['booking_orig'] +' | ' + item['booking_dest'] + ' | ' + item['customer'],
										value: item['booking_no']
									}
								}));
							},
							
					});
					
				},
				'select': function(item) {
								window.location = url_booking_update + item['value']
								//alert(url_booking+ item['value']);
				}
								
			});			
	
	});
//--></script> 

<script type="text/javascript"><!--
	$(document).ready(function() {
		
		var url_quote = 'index.php?route=service/customer/getQuoteRecord&token=<?php echo $token; ?>&filter_quotenumber=';
		var ActiveSession ='<?php echo $ActiveSession ?>';
		
		if (ActiveSession=='Quote'){
		var url_quote_use ='index.php?route=service/quotations/update&token=<?php echo $token; ?>&quote_no='; 
		} else {
		var url_quote_use =  'index.php?route=service/quotations/update&token=<?php echo $token; ?>&AddBooking=true&quote_no='; 
		}
		
		var quote_query = $('input[name=\'quotenumber\']').val();
			
			$('input[name=\'quotenumber\']').autocomplete({
				
				'source': function(request, response) {
					$.ajax({url: url_quote +  encodeURIComponent(request),
							dataType: 'json',
							success: function(json) {
								response($.map(json, function(item) {
									return {
										label: item['quote_no']  + ' | ' + item['quote_orig'] +' | ' + item['quote_dest'] + ' | ' + item['customer'] +' | '+item['quote_date'] ,
										value: item['quote_no']
									}
								}));
							},
							
					});
					
				},
				'select': function(item) {
								window.location = url_quote_use + item['value']
								//alert(url_booking+ item['value']);
				}
								
			});			
	
	});
//--></script> 

<script type="text/javascript"><!--
	
	var email_to_send = '<?php echo $email_to_send ?>';
	if (typeof email_to_send != 'undefined' && email_to_send.length >0){var new_contacts = 'No';} 
	
	
	function ContactAdd(x,y,z) { 
	    var email_to_send_contact = '<?php echo json_encode($email_to_send); ?>';

		if (new_contacts=='No' ){ var email_to_send_contact = JSON.parse('<?php echo json_encode($email_to_send) ?>');		} 
		else {var email_to_send_contact = [];	} 

	    $.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'ac_test', 'value':email_to_send_contact.length});
		var contact = {contact:x,email:y,customer_id:z};
		
		$('#customercontact').val(x);
		
		email_to_send_contact.push(contact);
		$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'email_to_send', 'value':email_to_send_contact});

		
        html  = '<div class="form-group">';
        html += '    <div class="row col-sm-10 col-sm-offset-2">';
        html += '         <div class="input-group">';
        html += '	      <input type="text" name="'+z+'" disabled="disabled" placeholder = "Contact" value="'+x+'" id="customercontact" class="form-control" />';
        html += '		  <span class="input-group-btn">';
        html += '				  <a type="button" id="button_contact_remove" data-toggle="tooltip" href="<?php echo $remove_contact; ?>&customer_id='+z+'" title="<?php echo $button_contact_remove; ?>" data-loading-text="<?php echo $text_contact_remove; ?>" class="btn btn-primary">';
        html += '		  <i class="fa fa-minus"></i>';
        html += '		  </a>';
        html += '		  <a data-toggle="modal" href="#myModal"  id="button_contact-method" data-toggle="tooltip" title="<?php echo $button_contact; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a>';
        html += '	      </span>';
        html += '         </div>';
        html += '    </div>';
        html += ' </div>';
        html += '  <div class="form-group">   ';
        html += '     <div class="row col-sm-10 col-sm-offset-2">';
        html += '       <input type="text" readonly="readonly" value="'+y+'" class="form-control" />';
        html += '   </div>';
        html += '  </div>';

        $('#Contacts').append(html);
        
		$('#myModal').modal('hide');
        $('#service_portofloading').focus();
		
		
	}

	function ContactRoutedAdd(x,y,z,a,b,c,d) { 
		var new_contacts = 'No'; $('#myModalRouted').modal('hide');
	    
		ContactAdd(x,y,z);
		ContactShipperAdd(a,b,c,d); 
		
	   
    	
	}

	function ContactShipperAdd(a,b,c,d) { 
		
	//var email_to_send_shipper = [];	
    var email_to_send_shipper = <?php echo json_encode($email_to_send_shipper); ?>;
    if (typeof email_to_send_shipper != 'undefined' && email_to_send_shipper.length >0){var new_contacts = 'No';} 
	
	if (new_contacts=='No' ){ 
		var email_to_send_shipper = JSON.parse('<?php echo json_encode($email_to_send_shipper) ?>');		
	} else {
		var email_to_send_shipper = [];	
	} 

	var contact = {contact:a,email:b,customer_id:c};
	
	//$('input[name=\'customerSignator\']').val(d);
	//$('#shippercontact').val(a);
	//$('#shipperemail').val(b);
	
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'customerSignator', 'value':d});
    $.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'shipper_contact_test', 'value':contact});
    
    email_to_send_shipper.push(contact);
	$.post('controller/setting/ajaxpersist.php', { 'fieldname' : 'email_to_send_shipper', 'value':email_to_send_shipper});

	
	}


	

	
</script> 

           