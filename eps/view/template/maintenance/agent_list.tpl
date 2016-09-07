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
                <label class="control-label" for="input-agent"><?php echo $column_name; ?></label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $column_name; ?>" id="input-agent" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_code"><?php echo $column_code; ?></label>
                <input type="text" name="filter_code" value="<?php echo $filter_code; ?>" placeholder="<?php echo $column_code; ?>" id="filter_code" class="form-control" />
             
              </div>
            </div>
             <div class="col-sm-3">
              <div class="form-group">
              	 <label class="control-label" for="filter_name2"><?php echo $column_name2; ?></label>
                <input type="text" name="filter_name2" value="<?php echo $filter_name2; ?>" placeholder="<?php echo $column_name2; ?>" id="input-name2" class="form-control" />
               </div>
              <div class="form-group">
                <label class="control-label" for="filter_name3"><?php echo $column_name3; ?></label>
                  <input type="text" name="filter_name3" value="<?php echo $filter_name3; ?>" placeholder="<?php echo $column_name3; ?>" id="filter_name3" class="form-control" />
              </div>
            </div>
             <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_country"><?php echo $column_country; ?></label>
                <input type="text" name="filter_country" value="<?php echo $filter_country; ?>" placeholder="<?php echo $column_country; ?>" id="input-country" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_service">Service</label>
                <input type="text" name="filter_service" value="" placeholder="" id="filter_service" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                 </div>
              
             
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
      <form action="<?php echo ($customer_link) ?>" method="post" id="customer_id">
      
            <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="left">Details</td>
              <td class="left"><?php if ($sort == 'name') { ?><a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a><?php } else { ?><a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'name2') { ?><a href="<?php echo $sort_name2; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name2; ?></a><?php } else { ?><a href="<?php echo $sort_name2; ?>"><?php echo $column_name2; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'name3') { ?><a href="<?php echo $sort_name3; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name3; ?></a><?php } else { ?><a href="<?php echo $sort_name3; ?>"><?php echo $column_name3; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'code') { ?><a href="<?php echo $sort_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_code; ?></a><?php } else { ?><a href="<?php echo $sort_code; ?>"><?php echo $column_code; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'country') { ?><a href="<?php echo $sort_country; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_country; ?></a><?php } else { ?><a href="<?php echo $sort_country; ?>"><?php echo $column_country; ?></a>  <?php } ?></td>
			 	
			 
              <?php if (isset($column_action)) { ?>
              <td class="right"><?php echo $column_action; ?></td>
              <?php } ?> 
              </tr>
          </thead>
          <tbody>
           
            <?php if ($agents) { ?> <?php foreach ($agents as $agent) { ?>
            <tr>
              <td class="right"><?php foreach ($agent['action'] as $action) { ?>
         <a type="button" id="button-agent-view" data-toggle="tooltip" href="<?php echo $action['href']; ?>" title="<?php echo $button_agent_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>
            
                <?php } ?></td>
              <td class="left"><?php echo $agent['name']; ?></td>
              <td class="left"><?php echo $agent['name2']; ?></td>
              <td class="left"><?php echo $agent['name3']; ?></td>
              <td class="left"><?php echo $agent['code']; ?></td>
              <td class="left"><?php echo $agent['country']; ?></td>
              
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
<script type="text/javascript"><!--
function filter() {
	<?php if (isset($insert)) { ?> 
	
	url = 'index.php?route=maintenance/agents&token=<?php echo $token; ?>';
	
	 <?php } else { ?> 
	url = 'index.php?route=maintenance/customer_search&token=<?php echo $token; ?>';
	 <?php } ?> 
	 
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	var filter_name2 = $('input[name=\'filter_name2\']').attr('value');
	var filter_name3 = $('select[name=\'filter_name3\']').attr('value');
	var filter_code = $('select[name=\'filter_code\']').attr('value');
	var filter_country = $('select[name=\'filter_country\']').attr('value');
	
	if (filter_name) {url += '&filter_name=' + encodeURIComponent(filter_name);}
	if (filter_name2) {url += '&filter_name2=' + encodeURIComponent(filter_name2);	}
	if (filter_name3) {url += '&filter_name3=' + encodeURIComponent(filter_name3);	}	
	if (filter_code) {	url += '&filter_code=' + encodeURIComponent(filter_code); 	}	
	if (filter_country ) {	url += '&filter_country=' + encodeURIComponent(filter_country);	}	
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 

<script type="text/javascript"><!--
$(document).ready(function(){
    $('input[name="filter_name"]').blur(function(){
          filter();
        });
});
//--></script> 


<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?> 