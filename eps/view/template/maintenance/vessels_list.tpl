<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" id="button-shipping" form="form-order" formaction="<?php echo $shipping; ?>" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></button>
        <button type="submit" id="button-invoice" form="form-order" formaction="<?php echo $invoice; ?>" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></button>
        <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
 <div class="panel panel-default">
     <div class="panel-heading">
     
      <div class="buttons"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></div>
   
    </div>
    <div class="content">
      <form action="<?php echo ($lcltransittime_link) ?>" method="post" id="lcltransittime">
      
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td></td>
              <td class="left"><?php if ($sort == 'rotation') { ?><a href="<?php echo $sort_rotation; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_rotation; ?></a><?php } else { ?><a href="<?php echo $sort_rotation; ?>"><?php echo $column_rotation; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'name') { ?><a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a><?php } else { ?><a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'voyage') { ?><a href="<?php echo $sort_voyage; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_voyage; ?></a><?php } else { ?><a href="<?php echo $sort_voyage; ?>"><?php echo $column_voyage; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'load') { ?><a href="<?php echo $sort_load; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_load; ?></a><?php } else { ?><a href="<?php echo $sort_load; ?>"><?php echo $column_load; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'unload') { ?><a href="<?php echo $sort_unload; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_unload; ?></a><?php } else { ?><a href="<?php echo $sort_unload; ?>"><?php echo $column_unload; ?></a>  <?php } ?></td>
			   <td class="left"><?php if ($sort == 'sail') { ?><a href="<?php echo $sort_sail; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sail; ?></a><?php } else { ?><a href="<?php echo $sort_sail; ?>"><?php echo $column_sail; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'eta') { ?><a href="<?php echo $sort_eta; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_eta; ?></a><?php } else { ?><a href="<?php echo $sort_eta; ?>"><?php echo $column_eta; ?></a>  <?php } ?></td>
			  	
			  
			  <?php if (isset($column_action)) { ?>
              <td class="right"><?php echo $column_action; ?></td>
              <?php } ?> 
              </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td><input type="text" name="filter_rotation" value="<?php echo $filter_rotation ?>" class="form-control" /></td>
			  <td><input type="text" name="filter_name" value="<?php echo $filter_name ?>" class="form-control" /></td>
              <td><input type="text" name="filter_voyage" value="<?php echo $filter_voyage ?>" class="form-control" /></td>
              <td><input type="text" name="filter_load" value="<?php echo $filter_load ?>" class="form-control" /></td>
              <td><input type="text" name="filter_unload" value="<?php echo $filter_unload ?>" class="form-control" /></td>
			  <td><input type="text" name="filter_sail" value="<?php echo $filter_sail ?>" class="form-control" /></td>
              <td><input type="text" name="filter_eta" value="<?php echo $filter_eta ?>" class="form-control" /></td>
             	
            </tr>
            <?php if ($vessels) { ?> <?php foreach ($vessels as $vessel) { ?>
            <tr>
            
             <td>
             <?php foreach ($vessel['action'] as $action) { ?>
              
                 <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $button_use_vessel; ?>" class="btn btn-primary"><i class="fa fa-anchor"></i></a> 
                <?php } ?>
                </td>
              <td class="left"><?php echo $vessel['rotation']; ?> / <?php echo $vessel['sequence']; ?></td>
              <td class="left"><?php echo $vessel['name']; ?></td>
              <td class="left"><?php echo $vessel['voyage']; ?></td>
              <td class="left"><?php echo $vessel['load']; ?></td>
              <td class="left"><?php echo $vessel['unload']; ?></td>
              <td class="left"><?php echo $vessel['sail']; ?></td>
              <td class="left"><?php echo $vessel['eta']; ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="10"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>

</div>
</div>
</div>
<script type="text/javascript"><!--
function filter() {
	<?php if (isset($insert)) { ?> 
	
	url = 'index.php?route=maintenance/vessels&token=<?php echo $token; ?>';
	
	 <?php } ?> 
	<?php if (isset($vessel_alt)) { ?> 
	
	url = 'index.php?route=maintenance/vessels&token=<?php echo $token; ?>&vessel_alt=true';
	
	<?php } ?>
	  
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	var filter_rotation = $('input[name=\'filter_rotation\']').attr('value');
	var filter_load = $('input[name=\'filter_load\']').attr('value');
	var filter_unload = $('input[name=\'filter_unload\']').attr('value');
	var filter_voyage = $('input[name=\'filter_voyage\']').attr('value');
	var filter_sail = $('input[name=\'filter_sail\']').attr('value');
	var filter_eta = $('input[name=\'filter_eta\']').attr('value');
	
	if (filter_name ) {	url += '&filter_name=' + encodeURIComponent(filter_name);	}	
	if (filter_rotation ) {	url += '&filter_rotation=' + encodeURIComponent(filter_rotation);	}
	if (filter_load ) {	url += '&filter_load=' + encodeURIComponent(filter_load);	}
	if (filter_unload ) {	url += '&filter_unload=' + encodeURIComponent(filter_unload);	}
	if (filter_sail ) {	url += '&filter_sail=' + encodeURIComponent(filter_sail);	}
	if (filter_voyage ) {	url += '&filter_voyage=' + encodeURIComponent(filter_voyage);	}
	
	location = url;
}
//--></script>
<script type="text/javascript"><!---// return keystrike //-->
	$(document).keypress(function(e) {
	   var code = e.keyCode || e.which;
	   if(code == 13) { filter();  }
	});

	$(document).ready(function() {
		$('#date').datepicker({dateFormat: 'yy-mm-dd'});
	});
//--></script>
<?php echo $footer; ?> 