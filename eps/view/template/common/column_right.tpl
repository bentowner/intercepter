        <div class="navbar-collapse collapse navbar-right" >
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Drafts/Stats <span class="caret"></span></a>
                    <ul class="dropdown-menu pull-right" role="menu">
                       	<li class="dropdown-header">Booking Drafts</li>
                       	<?php if ($booking_drafts) { ?><?php foreach ($booking_drafts as $bookingdraft) { ?><?php foreach ($bookingdraft['action'] as $actions) { ?>
     <li> <a href="<?php echo $actions['href']; ?>"><?php echo $actions['text']; ?> access until <?php echo $actions['goodtill']; ?></a>
     <a href="<?php echo $actions['release']; ?>">- Discard this draft for <?php echo $actions['text']; ?> -</a>
     </li>
     <?php } ?><?php } ?><?php } else{ ?>
                        <li><a>No Booking Drafts</a></li>
                        <?php } ?>
                        <li class="divider"></li>
                        <li class="dropdown-header">Quote Drafts</li>
                        
                       	<?php if ($quote_drafts) { ?><?php foreach ($quote_drafts as $quotedraft) { ?><?php foreach ($quotedraft['action'] as $quote_actions) { ?>
     <li> <a href="<?php echo $quote_actions['href']; ?>"><?php echo $quote_actions['text']; ?> access until <?php echo $quote_actions['goodtill']; ?> </a> 
     <a href="<?php echo $quote_actions['release']; ?>">- Discard this draft for <?php echo $quote_actions['text']; ?> -</a>
     </li>
     <?php } ?><?php } ?><?php } else{ ?>
                        <li><a>No Quote Drafts</a></li>
                        <?php } ?>
                        
                        
                        <li class="divider"></li>
                        
                      <?php if ($customer) { ?>
                        <li class="dropdown-header">Customer Statistics- <?php echo $customerName; ?></li>
                        <li><a href="<?php echo $customer_quote_link; ?>">Quote Recent: <?php echo $customer_90day_quote; ?></a></li>
                        <li><a href="<?php echo $customer_quote_link; ?>">Quote History: <?php echo $customer_total_quote; ?></a></li>
                        <li><a href="<?php echo $customer_booking_link; ?>">Booking Recent: <?php echo $customer_90day_booking; ?></a></li>
                        <li><a href="<?php echo $customer_booking_link; ?>">Booking History:<?php echo $customer_total_booking; ?></a></li>
                        
                        <li><a href="<?php echo $customer_booking_link; ?>" >Sales Rep: <?php echo $customer_sales_rep['SRName']; ?> / Commission type: <?php echo $customer_sales_rep['srtype']; ?></a></li>
                        <?php } else{ ?>
                        <li class="dropdown-header">Customer Statistics</li>
                        <li><a>No Customer Selected</a></li>
                        <?php } ?>
                    </ul>
                </li>
            </ul>
        </div>
        
        
     