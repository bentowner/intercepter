<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></div>
    <?php if (isset($insert)) { ?> 
      <div class="buttons"><a onclick="$('form').attr('action', '<?php echo $approve; ?>'); $('form').submit();" class="button"><?php echo $button_approve; ?></a>
      <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
      <a onclick="$('form').attr('action', '<?php echo $delete; ?>'); $('form').submit();" class="button"><?php echo $button_delete; ?></a>
      </div>
    <?php } ?>
    </div>
    <div class="content">
      <form action="<?php echo ($lcltransittime_link) ?>" method="post" id="lcltransittime">
      
        <table class="list">
          <thead>
            <tr>
              <td ></td>
              <td class="left">Approved</td>
              <td class="left"><?php if ($sort == 'rotation') { ?><a href="<?php echo $sort_rotation; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_rotation; ?></a><?php } else { ?><a href="<?php echo $sort_rotation; ?>"><?php echo $column_rotation; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'name') { ?><a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a><?php } else { ?><a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'voyage') { ?><a href="<?php echo $sort_voyage; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_voyage; ?></a><?php } else { ?><a href="<?php echo $sort_voyage; ?>"><?php echo $column_voyage; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'load') { ?><a href="<?php echo $sort_load; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_load; ?></a><?php } else { ?><a href="<?php echo $sort_load; ?>"><?php echo $column_load; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'unload') { ?><a href="<?php echo $sort_unload; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_unload; ?></a><?php } else { ?><a href="<?php echo $sort_unload; ?>"><?php echo $column_unload; ?></a>  <?php } ?></td>
			   <td class="left"><?php if ($sort == 'sail') { ?><a href="<?php echo $sort_sail; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sail; ?></a><?php } else { ?><a href="<?php echo $sort_sail; ?>"><?php echo $column_sail; ?></a>  <?php } ?></td>
			  <td class="left"><?php if ($sort == 'eta') { ?><a href="<?php echo $sort_eta; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_eta; ?></a><?php } else { ?><a href="<?php echo $sort_eta; ?>"><?php echo $column_eta; ?></a>  <?php } ?></td>
			  	
			  <td></td>	
			  <?php if (isset($column_action)) { ?>
              <td class="right"><?php echo $column_action; ?></td>
              <?php } ?> 
              </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td></td>
              <td><input type="text" name="filter_rotation" value="<?php echo $filter_rotation ?>" size="7"/></td>
			  <td><input type="text" name="filter_name" value="<?php echo $filter_name ?>" size="7"/></td>
              <td><input type="text" name="filter_voyage" value="<?php echo $filter_voyage ?>" size="7"/></td>
              <td><input type="text" name="filter_load" value="<?php echo $filter_load ?>" size="7"/></td>
              <td><input type="text" name="filter_unload" value="<?php echo $filter_unload ?>" size="7"/></td>
			  <td><input type="text" name="filter_sail" value="<?php echo $filter_sail ?>" size="7"/></td>
              <td><input type="text" name="filter_eta" value="<?php echo $filter_eta ?>" size="7"/></td>
               	
             <?php if (isset($column_status)) { ?> 
              <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>	  
			  <td><select name="filter_approved">
                  <option value="*"></option>
                  <?php if ($filter_approved) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_approved) && !$filter_approved) { ?>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select></td>
              <?php } ?> 
              
              <?php if (isset($column_action)) { ?> 
              <td align="right"></td>
              <?php } ?> 
              <td></td>	
            </tr>
            <?php if ($vessels) { ?> <?php foreach ($vessels as $vessel) { ?>
            <tr>
            
              <td style="text-align: center;">
              
              <?php if (isset($vessels_link)) { ?>
                <input type="checkbox" name = "dest_code" id="<?php echo ($lcltt_link) ?>" value="<?php echo $vessel['DestCode']; ?>" 
                onClick="this.form.submit();" />
              <?php } else{ ?> 
               <?php if ($vessel['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $vessel['country_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $vessel['country_id']; ?>" />
                <?php } ?>
              <?php } ?>
              </td> 
              <td  class="left">Yes</td>
              <td class="left"><?php echo $vessel['rotation']; ?> / <?php echo $vessel['sequence']; ?></td>
              <td class="left"><?php echo $vessel['name']; ?></td>
              <td class="left"><?php echo $vessel['voyage']; ?></td>
              <td class="left"><?php echo $vessel['load']; ?></td>
              <td class="left"><?php echo $vessel['unload']; ?></td>
              <td class="left"><?php echo $vessel['sail']; ?></td>
              <td class="left"><?php echo $vessel['eta']; ?></td>
              <td class="right"><?php foreach ($vessel['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
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
	
	url = 'index.php?route=maintenance/vessels&token=<?php echo $token; ?>';
	
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
<script type="text/javascript"><!--
	$('input[name="filter_name"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_rotation"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_load"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_unload"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_voyage"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_sail"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
	$('input[name="filter_eta"]').keydown(function(e) {if (e.keyCode == 13) {filter();	}});
//--></script> 

 


<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?> 