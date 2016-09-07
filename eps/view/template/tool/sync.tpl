<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-backup" data-toggle="tooltip" title="<?php echo $button_backup; ?>" class="btn btn-default"><i class="fa fa-download"></i></button>
        <button type="submit" form="form-restore" data-toggle="tooltip" title="<?php echo $button_restore; ?>" class="btn btn-default"><i class="fa fa-upload"></i></button>
      </div>
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
      <button type="button" form="form-backup" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-exchange"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $restore; ?>" method="post" enctype="multipart/form-data" id="form-restore" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-import"><?php echo $entry_restore; ?></label>
            <div class="col-sm-10">
              <input type="file" name="import" id="input-import" />
            </div>
          </div>
        </form>
        <form action="<?php echo $backup; ?>" method="post" enctype="multipart/form-data" id="form-backup" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_backup; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($tables as $table) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="backup[]" value="<?php echo $table; ?>" checked="checked" />
                    <?php echo $table; ?></label>
                </div>
                <?php } ?>
              </div>
              <a onclick="$(this).parent().find(':checkbox').prop('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').prop('checked', false);"><?php echo $text_unselect_all; ?></a></div>
          </div>
      <div class="col-sm-12">  
      <div class="table">  
          <table class="form">
          <tr>
            <td>Reconcile Process:</td>
            <td class="buttons"><a onclick="<?php echo $reconcile; ?>" class="button">Reconcile</a> </td>
            <td>1.) Completes mutually exclusive transactions <br>2.) Presents conflicting Items for the matching process</td>
          </tr>
         
        </table>
        </div>
      </div>
      <form action="<?php echo $backup; ?>" method="post" enctype="multipart/form-data" id="backup">
        <table class="form">
          <tr>
            <td>Match items:</td>
            <td><div class="scrollbox" style="margin-bottom: 5px;">
                <?php $class = 'odd'; ?>
                <?php $i=0; ?>
                <?php foreach ($reconcile_items as $reconcile_item) {  ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
               
                <div class="<?php echo $class; ?>">
                  <input type="checkbox" name="recon[]" value="<?php echo $reconcile_item; ?>" checked="checked" />
                  <?php echo "$reconcile_item[$i]"; $i++ ?></div>
                <?php } ?>
               
              </div>
              <a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a></td>
          </tr>
        </table>
       </div> 
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>