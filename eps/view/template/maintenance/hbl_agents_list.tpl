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
              	 <label class="control-label" for="filter_base"><?php echo $column_base; ?></label>
                <input type="text" name="filter_name2" value="<?php echo $filter_base; ?>" placeholder="<?php echo $column_base; ?>" id="input-name2" class="form-control" />
               </div>
              <div class="form-group">
                <label class="control-label" for="filter_service">Service</label>
                  <input type="text" name="filter_service" value="" placeholder="" id="filter_service" class="form-control" />
              </div>
            </div>
             <div class="col-sm-3">
              <div class="form-group">
                <label class="control-label" for="filter_orig"><?php echo $column_orig; ?></label>
                <input type="text" name="filter_orig" value="<?php echo $filter_orig; ?>" placeholder="<?php echo $column_orig; ?>" id="input-orig" class="form-control" />
              </div>
              <div class="form-group">
                <label class="control-label" for="filter_dest"><?php echo $column_dest; ?></label>
                <input type="text" name="filter_dest" value="" placeholder="" id="filter_dest" class="form-control" />
              </div>
            </div>
            <div class="col-sm-3">
              <div class="form-group">
                 </div>
              
             
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
      <form action="<?php echo ($destination_link) ?>" method="post" id="dest_code">
      
            <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td ></td>
             
              <td class="left"><?php if ($sort == 'name') { ?><a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a><?php } else { ?><a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'code') { ?><a href="<?php echo $sort_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_code; ?></a><?php } else { ?><a href="<?php echo $sort_code; ?>"><?php echo $column_code; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'base') { ?><a href="<?php echo $sort_base; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_base; ?></a><?php } else { ?><a href="<?php echo $sort_base; ?>"><?php echo $column_base; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'orig') { ?><a href="<?php echo $sort_orig; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_orig; ?></a><?php } else { ?><a href="<?php echo $sort_orig; ?>"><?php echo $column_orig; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'dest') { ?><a href="<?php echo $sort_dest; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_dest; ?></a><?php } else { ?><a href="<?php echo $sort_dest; ?>"><?php echo $column_dest; ?></a>  <?php } ?></td>
			 	
			  <td></td>	
			  <?php if (isset($column_action)) { ?>
              <td class="right"><?php echo $column_action; ?></td>
              <?php } ?> 
              </tr>
          </thead>
          <tbody>
            
            <?php if ($hbl_agents) { ?> <?php foreach ($hbl_agents as $hbl_agent) { ?>
            <tr>
            
              <td class="right"><?php foreach ($hbl_agent['action'] as $action) { ?>
              <a type="button" id="button-agent-view" data-toggle="tooltip" href="<?php echo $action['href']; ?>" title="<?php echo $button_agent_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>
         
                <?php } ?></td>
              <td class="left"><?php echo $hbl_agent['name']; ?></td>
              <td class="left"><?php echo $hbl_agent['code']; ?></td>
              <td class="left"><?php echo $hbl_agent['base']; ?></td>
              <td class="left"><?php echo $hbl_agent['orig']; ?></td>
              <td class="left"><?php echo $hbl_agent['dest']; ?></td>
              
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
	
	url = 'index.php?route=maintenance/hbl_agents&token=<?php echo $token; ?>';
	
	 <?php } ?> 
	 
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	var filter_code = $('input[name=\'filter_code\']').attr('value');
	var filter_base = $('input[name=\'filter_base\']').attr('value');
	var filter_orig = $('input[name=\'filter_orig\']').attr('value');
	var filter_dest = $('input[name=\'filter_dest\']').attr('value');
	
	if (filter_name) {url += '&filter_name=' + encodeURIComponent(filter_name);}
	if (filter_code) {	url += '&filter_code=' + encodeURIComponent(filter_code); 	}	
	if (filter_base ) {	url += '&filter_base=' + encodeURIComponent(filter_base);	}	
	if (filter_orig ) {	url += '&filter_orig=' + encodeURIComponent(filter_orig);	}	
	if (filter_dest ) {	url += '&filter_dest=' + encodeURIComponent(filter_dest);	}	
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
	$('input[name="filter_name"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_code"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_base"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_orig"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_dest"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
//--></script> 

<script type="text/javascript"><!--
$(document).ready(function(){
    $('input[name="filter_name"]').blur(function(){
          filter();
        });
    $('input[name="filter_code"]').blur(function(){
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