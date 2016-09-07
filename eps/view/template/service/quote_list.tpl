<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading" style="background:purple;">
        <h3 class="panel-title" style="color:yellow;"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_quotenumber"><?php echo $entry_quotenumber; ?></label>
                <input type="text" name="filter_quotenumber" value="<?php echo $filter_quotenumber; ?>" placeholder="<?php echo $entry_quotenumber; ?>" id="filter_quotenumber" class="form-control" />
              	<input type="hidden" name="filter_status" value="<?php echo $filter_status; ?>" placeholder="<?php echo $entry_status; ?>" id="filter_status" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_customer"><?php echo $entry_customer; ?></label>
                <input type="hidden" name="filter_customer_code" value="<?php echo $filter_customer_code; ?>" id="filter_customer_code" class="form-control" />
                <input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="filter_customer" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_origin"><?php echo $entry_origin; ?></label>
                <input type="hidden" name="filter_origin_code" value="<?php echo $filter_origin_code; ?>"  id="filter_origin_code" class="form-control" />
                <input type="text" name="filter_origin" value="<?php echo $filter_origin; ?>" placeholder="<?php echo $entry_origin; ?>" id="filter_origin" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_destination"><?php echo $entry_destination; ?></label>
                <input type="hidden" name="filter_destination_code" value="<?php echo $filter_destination_code; ?>"  id="filter_destination_code" class="form-control" />
                <input type="text" name="filter_destination" value="<?php echo $filter_destination; ?>" placeholder="<?php echo $entry_destination; ?>" id="filter_destination" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_commodity"><?php echo $entry_commodity; ?></label>
                <input type="text" name="filter_commodity" value="<?php echo $filter_commodity; ?>" placeholder="<?php echo $entry_commodity; ?>" id="filter_commodity" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_sref"><?php echo $entry_ship_reference; ?></label>
                <input type="text" name="filter_sref" value="<?php echo $filter_sref; ?>" placeholder="<?php echo $entry_ship_reference; ?>" id="filter_sref" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              
              <div class="form-group">
                <label class="control-label" for="filter_date_added"><?php echo $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="DD-MM-YYYY" id="filter_date_added" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
           <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
             </div>
          </div>
        </div>
        <form method="post" enctype="multipart/form-data" target="_blank" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td class="text-right"><?php echo $column_action; ?></td>
                  <td class="text-right"><?php if ($sort == 'BKRef') { ?>
                    <a href="<?php echo $sort_quote_id; ?>" class="<?php echo strtolower($quote); ?>"><?php echo $column_quote_id; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_quote_id; ?>"><?php echo $column_quote_id; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'BkCust') { ?>
                    <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($quote); ?>"><?php echo $column_customer; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                    <?php } ?></td>
                     <td class="text-left"><?php if ($sort == 'BKdate') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($quote); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?></td>
                 <td class="text-left"><?php if ($sort == 'BkComm') { ?>
                    <a href="<?php echo $sort_commodity; ?>" class="<?php echo strtolower($quote); ?>"><?php echo $column_commodity; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_commodity; ?>"><?php echo $column_commodity; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'BkSref') { ?>
                    <a href="<?php echo $sort_sref; ?>" class="<?php echo strtolower($quote); ?>"><?php echo $column_sref; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sref; ?>"><?php echo $column_sref; ?></a>
                    <?php } ?></td>
                 
                    <td class="text-right"><?php if ($sort == 'BkOrig') { ?>
                    <a href="<?php echo $sort_origin; ?>" class="<?php echo strtolower($quote); ?>"><?php echo $column_origin; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_origin; ?>"><?php echo $column_origin; ?></a>
                    <?php } ?></td>
                    <td class="text-left"><?php if ($sort == 'BkDest') { ?>
                    <a href="<?php echo $sort_destination; ?>" class="<?php echo strtolower($quote); ?>"><?php echo $column_destination; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_destination; ?>"><?php echo $column_destination; ?></a>
                    <?php } ?></td>
                     
                  
                  
                </tr>
              </thead>
              <tbody>
                <?php if ($quotes) { ?>
                <?php foreach ($quotes as $quote) { ?>
                <tr>
                  <td class="text-right"><a href="<?php echo $quote['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                  <td class="text-right"><?php echo $quote['quotenumber']; ?></td>
                  <td class="text-left"><?php echo $quote['customer']; ?></td>
                  <td class="text-left"><?php echo $quote['date_added']; ?></td>
                  <td class="text-left"><?php echo $quote['commodity']; ?></td>
                  <td class="text-left"><?php echo $quote['sref']; ?></td>
                  <td class="text-right"><?php echo $quote['origin']; ?></td>
                  <td class="text-left"><?php echo $quote['destination']; ?></td>
                 
                  
                   </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Modal -->
  <div class="modal fade" id="draftModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="background:purple;">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"  style="color:yellow;"><b><i>Manage Drafts - Quotes </b></i></h4>
        </div>
        <div class="modal-body">
          <div class="row header contact">
			<div class="col-lg-12" >
			<div class="table">
			<div class=".col-lg-12 col-md-12 col-sm-6" >
			
			 </div>
			<div class="row" >
			<table id="customer_contacts" class="table table-bordered">
				<thead>
					<tr>
					<td>Draft Reference</td>
					<td>Customer</td>
					<td>Contact</td>
					<td>Valid until</td>
					<td>Use</td>
					<td>Delete</td><td>Status</td>
					</tr>
				</thead>
				<tbody >
				
				 <?php if(isset($quote_drafts)) { ?>
				
	 				<?php foreach ($quote_drafts as $quote_draft) {?>
	 				<tr class = "customer_contacts_detail">
						<?php foreach($quote_draft['action'] as $action) { ?>
						<td class="txt-contact"><?php echo $action['text']; ?></td>
						<td><?php echo $action['customer']; ?></td>
						<td><?php echo $action['contact']; ?></td>
						<td class="txt-contact"><?php echo $action['goodtill']; ?></td>
						<td class="txt-contact"><a  id="closemodal" type="button"  href="<?php echo $action['href'];?>"  class="btn btn-primary" onclick="$('#draftModal').modal('hide')" data-toggle="tooltip"  title="<?php echo $action['text']; ?>"  ><i class="fa fa-plus"></i></a>
						</td>
						<td class="txt-contact"><a  id="closemodal2" type="button" href="<?php echo $action['release'];?>" class="btn btn-danger" data-toggle="tooltip" title="Delete this Draft / Release" ><i class="fa fa-minus"></i></a>
						</td><td class="txt-contact"><?php echo $action['status']; ?></td>
						<?php } ?>
					<tr>
					<?php } ?>
					<tr>
					
				<?php } ?>
				
				</tbody>
			 </table>
			 </div>
			  <div  class=".col-lg-10 .col-lg-offset-2  .col-md-10 .col-md-offset-2  .col-sm-6" >
			 	<div class="text-muted"><span>Accomplish multiple tasks by using drafts. Click <a href="<?php echo HTTP_HELP;?>Drafts" target="_blank">here</a> for more information about how to use Drafts.</a></span> </div>
			 </div><!-- end row -->
			</div> 
			   
			 </div> 
        </div>
        <div class="modal-footer">
         
          <button type="button" class="btn btn-default" data-dismiss="modal">Finished</button>
          
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal --> 
<script type="text/javascript"><!---// return keystrike //-->
$(document).keypress(function(e) {
   var code = e.keyCode || e.which;
   if(code == 13) {
    $('#button-filter').trigger("click");
  }
});

</script>

<script type="text/javascript"><!--
	$('#button-filter').on('click', function() {url = 'index.php?route=service/quotations&token=<?php echo $token; ?>';

	var Resend_Quote = '<?php echo $Resend_Quote; ?>';
	if (Resend_Quote) {url += '&Resend_Quote=' + encodeURIComponent(Resend_Quote);}
	
	var filter_quotenumber = $('input[name=\'filter_quotenumber\']').val();
	if (filter_quotenumber) {url += '&filter_quotenumber=' + encodeURIComponent(filter_quotenumber);}
	
	var filter_customer = $('input[name=\'filter_customer\']').val();
	var filter_customer_code = $('input[name=\'filter_customer_code\']').val();
	if (filter_customer) {if (filter_customer_code) {url += '&filter_customer_code=' + encodeURIComponent(filter_customer_code);}}
	
	var filter_origin = $('input[name=\'filter_origin\']').val();
	var filter_origin_code = $('input[name=\'filter_origin_code\']').val();
	if (filter_origin) {if (filter_origin_code) {url += '&filter_origin=' + encodeURIComponent(filter_origin_code);}}
	
	var filter_destination_code = $('input[name=\'filter_destination_code\']').val();
	var filter_destination = $('input[name=\'filter_destination\']').val();
	if (filter_destination) {if (filter_destination_code) {url += '&filter_destination=' + encodeURIComponent(filter_destination_code);}}
		
	var filter_status = $('input[name=\'filter_status\']').val();
	if (filter_status) {url += '&filter_status=' + encodeURIComponent(filter_status);}	

	var filter_date_added = $('input[name=\'filter_date_added\']').val();
	if (filter_date_added) {url += '&filter_date_added=' + encodeURIComponent(filter_date_added);	}
	
	var filter_commodity = $('input[name=\'filter_commodity\']').val();
	if (filter_commodity) {url += '&filter_commodity=' + encodeURIComponent(filter_commodity);	}
	
	var filter_date_modified = $('input[name=\'filter_date_modified\']').val();
	if (filter_date_modified) {url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);}
	
			
	
	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
  $(document).ready(function() {
  var draft = '<?php echo $draft; ?>';
  if (draft=='true'){	manageDraft();	}
  });
  
  	function manageDraft(){	  $('#draftModal').modal('show');	  	}

  
$('input[name=\'filter_customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=service/customer/getBookingCustomer&token=<?php echo $token; ?>&filter_custkey=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['CustName1'],
						value: item['CustCode']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_customer_code\']').val(item['value']);
		$('input[name=\'filter_customer\']').val(item['label']);
	}	
});
//--></script> 
<script type="text/javascript"><!---// Service Port of Loading //-->
 $('input[name=\'filter_origin\']').autocomplete({
	
	'source': function(request, response) {
		$.ajax({url: 'index.php?route=service/service/getPortofLoading&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['service_portofloading'],
							value: item['service_portofloading_code']
						}}));
					}});
		},
	'select': function(item) {
		$('input[name=\'filter_origin_code\']').val(item['value']);
		$('input[name=\'filter_origin\']').val(item['label']);
		}			            
	});

</script> 
<script type="text/javascript"> <!---// Service Port of Dest //-->
 $('input[name=\'filter_destination\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=service/service/getPortofDest&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
					response($.map(json, function(item) {
						return {
						value: 	item['service_portofdest_code'],
						label: item['service_portofdest'],
						
					}}));
					
				}});
		},
	'select': function(item) {						
		$('input[name=\'filter_destination_code\']').val(item['value']);
		$('input[name=\'filter_destination\']').val(item['label']);
		}
	});
</script>


  
  <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript">
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  </script>
<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});
	//-->
</script>
</div>
<?php echo $footer; ?>