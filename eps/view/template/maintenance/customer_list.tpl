<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $customeradd; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a></div>
      
		
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
                <label class="control-label" for="filter_custkey"><?php echo $column_custkey; ?></label>
                <input type="hidden" name="filter_customer_code" value="<?php echo $filter_customer_code; ?>" id="filter_customer_code" class="form-control" />
                <input type="text" name="filter_custkey" value="<?php echo $filter_custkey; ?>" placeholder="<?php echo $column_custkey; ?>" id="filter_custkey" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_custcode"><?php echo $column_custcode; ?></label>
                <input type="text" name="filter_custcode" value="<?php echo $filter_custcode; ?>" placeholder="<?php echo $column_custcode; ?>" id="filter_custcode" class="form-control" />
              </div>
            </div>
            
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_custstreet"><?php echo $column_custstreet; ?></label>
                <input type="text" name="filter_custstreet" value="<?php echo $filter_custstreet; ?>" placeholder="<?php echo $column_custstreet; ?>" id="filter_custstreet" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_custstate"><?php echo $column_custstate; ?></label>
                  <input type="text" name="filter_custstate" value="<?php echo $filter_custstate; ?>" placeholder="<?php echo $column_custstate; ?>" id="filter_custstate" class="form-control" />
              </div>
            </div>
            
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_custzip"><?php echo $column_custzip; ?></label>
                <input type="text" name="filter_custzip" value="<?php echo $filter_custzip; ?>" placeholder="<?php echo $column_custzip; ?>" id="input-commodity" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_custtel"><?php echo $column_custtel; ?></label>
                <input type="text" name="filter_custtel" value="<?php echo $filter_custtel; ?>" placeholder="<?php echo $column_custtel;?>" id="filter_custtel" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_salesrep"><?php echo $column_salesrep; ?></label>
                <input type="text" name="filter_salesrep" value="<?php echo $filter_salesrep ?>" placeholder="<?php echo $column_salesrep; ?>" id="filter_salesrep" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_custefax"><?php echo $column_export_fax; ?></label>
                <input type="text" name="filter_custefax" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $column_export_fax;?>"  class="form-control" />
                 
              </div>
             
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form method="post" enctype="multipart/form-data" target="_blank" id="form-customer">
   
     
       <div class="table-responsive">
            <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td ></td>
              <td class="left"><?php if ($sort == 'custkey') { ?><a href="<?php echo $sort_custkey; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custkey; ?></a><?php } else { ?><a href="<?php echo $sort_custkey; ?>"><?php echo $column_custkey; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'custcode') { ?><a href="<?php echo $sort_custcode; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custcode; ?></a><?php } else { ?><a href="<?php echo $sort_custcode; ?>"><?php echo $column_custcode; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'custstreet') { ?><a href="<?php echo $sort_custstreet; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custstreet; ?></a><?php } else { ?><a href="<?php echo $sort_custstreet; ?>"><?php echo $column_custstreet; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'custstate') { ?><a href="<?php echo $sort_custstate; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custstate; ?></a><?php } else { ?><a href="<?php echo $sort_custstate; ?>"><?php echo $column_custstate; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'custzip') { ?><a href="<?php echo $sort_custzip; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custzip; ?></a><?php } else { ?><a href="<?php echo $sort_custzip; ?>"><?php echo $column_custzip; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'custtel') { ?><a href="<?php echo $sort_custtel; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custtel; ?></a><?php } else { ?><a href="<?php echo $sort_custtel; ?>"><?php echo $column_custtel; ?></a>  <?php } ?></td>
			<?php if (isset($column_custefax)) { ?>   
			  <td class="left"><?php if ($sort == 'custefax') { ?><a href="<?php echo $sort_custefax; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custefax; ?></a><?php } else { ?><a href="<?php echo $sort_custefax; ?>"><?php echo $column_custefax; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'custifax') { ?><a href="<?php echo $sort_custifax; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_custifax; ?></a><?php } else { ?><a href="<?php echo $sort_custifax; ?>"><?php echo $column_custifax; ?></a>  <?php } ?></td>
             <?php } ?> 
              <?php if (isset($column_status)) { ?> 
              
              <?php } ?> 
             
              </tr>
          </thead>
          <tbody>
            
            <?php if ($customers) { ?>
            	  <?php foreach ($customers as $customer) { ?>
            <tr>
             
              
              	
            	<td class="right"><?php foreach ($customer['action'] as $action) { ?>
            	
                
                <a type="button" id="button-customer-view" data-toggle="tooltip" href="<?php echo$action['href']; ?>" title="<?php echo $button_customer_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>
       
                <?php } ?></td>
             
              <td class="left"><?php echo $customer['custkey']; ?></td>
              <td class="left"><?php echo $customer['CustCode']; ?></td>
              <td class="left"><?php echo $customer['CustStreet']; ?></td>
              <td class="left"><?php echo $customer['CustState']; ?></td>
              <td class="left"><?php echo $customer['CustZip']; ?></td>
              <td class="left"><?php echo $customer['CustTel']; ?></td>
             
             <?php if (isset($column_custefax)) { ?>   
              <td class="left"><?php echo $customer['CustEFax']; ?></td>
              <td class="left"><?php echo $customer['CustIFax']; ?></td>
              <?php } ?> 
              
              
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
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
	url = 'index.php?route=maintenance/customer&token=<?php echo $token; ?>';
	
	var filter_custcode = $('input[name=\'filter_custcode\']').val();
	if (filter_custcode) {url += '&filter_custcode=' + encodeURIComponent(filter_custcode);	}
	
	var filter_custkey = $('input[name=\'filter_custkey\']').val();
	if (filter_custkey) {url += '&filter_custkey=' + encodeURIComponent(filter_custkey);	}

	var filter_custstreet = $('input[name=\'filter_custstreet\']').val();
	if (filter_custstreet) {url += '&filter_custstreet=' + encodeURIComponent(filter_custstreet);	}

	var filter_custstate = $('input[name=\'filter_custstate\']').val();
	if (filter_custstate) {url += '&filter_custstate=' + encodeURIComponent(filter_custstate);	}

	var filter_custzip = $('input[name=\'filter_custzip\']').val();
	if (filter_custzip) {url += '&filter_custzip=' + encodeURIComponent(filter_custzip);	}

	var filter_custtel = $('input[name=\'filter_custtel\']').val();
	if (filter_custtel) {url += '&filter_custtel=' + encodeURIComponent(filter_custtel);	}
	
	var filter_custefax = $('input[name=\'filter_custefax\']').val();
	if (filter_custefax) {url += '&filter_custefax=' + encodeURIComponent(filter_custefax);	}

	var filter_custifax = $('input[name=\'filter_custifax\']').val();
	if (filter_custifax) {url += '&filter_custifax=' + encodeURIComponent(filter_custifax);	}

	var filter_salesrep = $('input[name=\'filter_salesrep\']').val();
	if (filter_salesrep) {url += '&filter_salesrep=' + encodeURIComponent(filter_salesrep);	}
	
	var Use = '<?php echo $Use; ?>';
	if (Use) {url += '&Use=' + encodeURIComponent(Use);}
	
	
	
	location = url;
});
//--></script> 

<script type="text/javascript"><!--
$('input[name=\'filter_custkey\']').autocomplete({
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
		$('input[name=\'filter_custkey\']').val(item['label']);
		$('input[name=\'filter_custcode\']').val(item['value']);
	}	
});
//--></script>

 

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?> 