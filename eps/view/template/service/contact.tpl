<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button id="button-send" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_send; ?>" class="btn btn-primary" onclick="send('index.php?route=service/contact/send&token=<?php echo $token; ?>');"><i class="fa fa-envelope"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> Finished</a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
    
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-envelope"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
      
 <?php if ($error_warning) { ?> <div class="warning" id="error_warning"><?php echo $error_warning; ?></div> <?php } ?>
 <?php if ($error_message) { ?> <div class="attention" id="error_message"><?php echo $error_message; ?></div> <?php } ?>
 <?php if ($cts_success) { ?> <div class="success"><?php echo $cts_success; ?></div><?php } ?>
        <form class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-store"><?php echo $entry_from; ?></label>
            <div class="col-sm-10">
             <span style="line-height:40px;"><?php echo $entry_sent_from; ?></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-to"><?php echo $entry_to; ?></label>
            <div class="col-sm-10">
              <select name="to" id="input-to" class="form-control">
                <option value="customer"><?php echo $text_customer; ?></option>
              </select>
            </div>
          </div>
          <div class="form-group to" id="to-customer-group">
            <label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_customer_group; ?></label>
            <div class="col-sm-10">
              <select name="customer_group_id" id="input-customer-group" class="form-control">
                <?php foreach ($customer_groups as $customer_group) { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group to" id="to-customer">
            <label class="col-sm-2 control-label" for="input-customer"><span data-toggle="tooltip" title="<?php echo $help_customer; ?>"><?php echo $entry_customer; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="customers" value="" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
              
             
               
              <div id="customer" class="well well-sm" style="height: 120px; overflow: auto;">
              
               <?php if ($email_to_send) { ?>
               
               <?php $length = count($email_to_send); for ($i = 0; $i < $length; $i++) { ?>
                   <div id="customer<?php echo $email_to_send[$i]['customer_id']; ?>"><i class="fa fa-minus-circle"></i>
                   <?php echo $email_to_send[$i]['contact']; ?> - <?php echo $email_to_send[$i]['email']; ?> <input type="hidden" name="customer[]" value="<?php echo $email_to_send[$i]['customer_id']; ?>" />
                   </div>
               	<?php } ?>
               <?php } ?>
              </div>
              
              
            </div>
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-subject"><?php echo $entry_subject; ?></label>
            <div class="col-sm-10">
              <input type="text" name="subject" value="<?php echo $subject; ?>" placeholder="<?php echo $entry_subject; ?>" id="input-subject" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-message"><?php echo $entry_message; ?></label>
            <div class="col-sm-10">
              <textarea name="message" placeholder="<?php echo $entry_message; ?>" id="input-message" class="form-control">
              <?php echo $emailheader; ?>
              <?php echo $message; ?>
             
              </textarea>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--
		$('#input-message').summernote({
			height: 300
		});
		//--></script> 
		  <script type="text/javascript"><!--	
		$('select[name=\'to\']').on('change', function() {
			$('.to').hide();
			
			$('#to-' + this.value.replace('_', '-')).show();
		});
		
		$('select[name=\'to\']').trigger('change');
		//-->
  </script> 
 <script type="text/javascript"><!--
	// Customers
	$('input[name=\'customers\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',			
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['customer_id'],
							value2: item['email']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'customers\']').val('');
			
			$('#customer' + item['value']).remove();
			
			$('#customer').append('<div id="customer' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + ' - ' + item['value2'] + '<input type="hidden" name="customer[]" value="' + item['value'] + '" /></div>');	

			$.post("controller/setting/ajaxpersist.php", {"fieldname" : "email_sent","value":item['value2']});
		}	
	});
	
	$('#customer').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});



	function send(url) {
		// Summer not fix
		$('textarea[name=\'message\']').html($('#input-message').code());
		
		finish_url = 'index.php?route=service/contact/FSWebsite&token=<?php echo $token; ?>';
		
		$.ajax({
			url: url,
			type: 'post',
			data: $('#content select, #content input, #content textarea'),		
			dataType: 'json',
			beforeSend: function() {
				$('#button-send').button('loading');	
			},
			complete: function() {
				$('#button-send').button('reset');
				window.location=finish_url;	
			},				
			success: function(json) {
				$('.alert, .text-danger').remove();
				
				if (json['error']) {
					if (json['error']['warning']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '</div>');
					}
					
					if (json['error']['subject']) {
						$('input[name=\'subject\']').after('<div class="text-danger">' + json['error']['subject'] + '</div>');
					}	
					
					if (json['error']['message']) {
						$('textarea[name=\'message\']').parent().append('<div class="text-danger">' + json['error']['message'] + '</div>');
					}									
				}			
				
				if (json['next']) {
					if (json['success']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i>  ' + json['success'] + '</div>');
						
						send(json['next']);
					}		
				} else {
					if (json['success']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					}					
				}	
					
			}
		});
	}
	//-->
</script>

        
         </div>
<?php echo $footer; ?>