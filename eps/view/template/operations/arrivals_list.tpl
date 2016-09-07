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
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_receipt">Arrival Receipt</label>
                <input type="text" name="filter_receipt" value="<?php echo $filter_receipt; ?>"  id="filter_receipt" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_booking_id">Booking Number</label>
                <input type="text" name="filter_booking_id" value="<?php echo $filter_booking_id; ?>" id="filter_booking_id" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_warehouse">Warehouse</label>
                  <input type="text" name="filter_warehouse" value="<?php echo $filter_warehouse; ?>" id="filter_warehouse" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_po_pro">PO / Pro Number</label>
                 <input type="text" name="filter_po_pro" value="<?php echo $filter_po_pro; ?>"  id="filter_po_pro" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_recv_from">Received From</label>
                <input type="text" name="filter_recv_from" value="<?php echo $filter_recv_from; ?>" id="filter_recv_from" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_recv_via">Received Via</label>
                <input type="text" name="filter_recv_via" value="<?php echo $filter_recv_via; ?>" id="filter_recv_via" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_load_plan">Load Plan</label>
                <input type="text" name="filter_load_plan" value="<?php echo $filter_load_plan; ?>"  id="filter_load_plan" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_date_added">Date Added</label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" data-date-format="DD-MM-YYYY" id="filter_date_added" class="form-control" />
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
                  <td class="text-right"></td>
                  <td class="text-right"><?php if ($sort == 'Arrcode') { ?>
                    <a href="<?php echo $sort_receipt; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_receipt; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_receipt; ?>"><?php echo $column_receipt; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'BkCust') { ?>
                    <a href="<?php echo $sort_booking_no; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_booking_no; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_booking_no; ?>"><?php echo $column_booking_no; ?></a>
                    <?php } ?></td>
                     <td class="text-left"><?php if ($sort == 'BKdate') { ?>
                    <a href="<?php echo $sort_warehouse; ?>" ><?php echo $column_warehouse; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_warehouse; ?>"><?php echo $column_warehouse; ?></a>
                    <?php } ?></td>
                 
                  <td class="text-right"><?php if ($sort == 'BkSref') { ?>
                    <a href="<?php echo $sort_sref; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_po_pro; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sref; ?>"><?php echo $column_po_pro; ?></a>
                    <?php } ?></td>
                 <td class="text-right"><?php if ($sort == 'BKVess') { ?>
                    <a href="<?php echo $sort_vessel; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_recv_from; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_vessel; ?>"><?php echo $column_recv_from; ?></a>
                    <?php } ?></td>
                    <td class="text-right"><?php if ($sort == 'BkOrig') { ?>
                    <a href="<?php echo $sort_origin; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_recv_via; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_origin; ?>"><?php echo $column_recv_via; ?></a>
                    <?php } ?></td>
                    <td class="text-right"><?php if ($sort == 'BkDest') { ?>
                    <a href="<?php echo $sort_destination; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_load_plan; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_destination; ?>"><?php echo $column_load_plan; ?></a>
                    <?php } ?></td>
                     <td class="text-right"><?php if ($sort == 'BkComm') { ?>
                    <a href="<?php echo $sort_commodity; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_commodity; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'BkStat') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($booking); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  
                </tr>
              </thead>
              <tbody>
                <?php if ($arrivals) { ?>
                <?php foreach ($arrivals as $arrival) { ?>
                <tr>
                  <td class="text-right"><a href="<?php echo $arrival['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                  <td class="text-right"><?php echo $arrival['receipt']; ?></td>
                  <td class="text-left"><?php echo $arrival['booking_id']; ?></td>
                  <td class="text-left"><?php echo $arrival['warehouse']; ?></td>
                  <td class="text-right"><?php echo $arrival['po_pro']; ?></td>
                  <td class="text-right"><?php echo $arrival['recv_from']; ?></td>
                  <td class="text-left"><?php echo $arrival['recv_via']; ?></td>
                  <td class="text-left"><?php echo $arrival['load_plan']; ?></td>
                  <td class="text-right"><?php echo $arrival['date_added']; ?></td>
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
  
  
  <script type="text/javascript"><!---// return keystrike //-->
$(document).keypress(function(e) {
   var code = e.keyCode || e.which;
   if(code == 13) {
    $('#button-filter').trigger("click");
  }
});

</script>
  
  <script type="text/javascript"><!--
  
  
$('#button-filter').on('click', function() {
	url = 'index.php?route=operations/arrivals&token=<?php echo $token; ?>';
	
	var filter_booking_id = $('input[name=\'filter_booking_id\']').val();
	if (filter_booking_id) {url += '&filter_booking_id=' + encodeURIComponent(filter_booking_id);}
	
	var filter_receipt = $('input[name=\'filter_receipt\']').val();
	if (filter_receipt) {if (filter_receipt) {url += '&filter_receipt=' + encodeURIComponent(filter_receipt);}}
	
	
	
	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
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


  <script type="text/javascript"><!--
$('input[name^=\'selected\']').on('change', function() {
	$('#button-shipping, #button-invoice').prop('disabled', true);
	
	var selected = $('input[name^=\'selected\']:checked');
	
	if (selected.length) {
		$('#button-invoice').prop('disabled', false);
	}
	
	for (i = 0; i < selected.length; i++) {
		if ($(selected[i]).parent().find('input[name^=\'shipping_code\']').val()) {
			$('#button-shipping').prop('disabled', false);
			
			break;
		}
	}
});

$('input[name^=\'selected\']:first').trigger('change');

$('a[id^=\'button-delete\']').on('click', function(e) {
	e.preventDefault();
	
	if (confirm('<?php echo $text_confirm; ?>')) {
		location = $(this).attr('href');
	}
});
//--></script> 
  <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?>