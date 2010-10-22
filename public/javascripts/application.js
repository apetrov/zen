// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function createVisualEffects(){
	$(".draggable").draggable({ cursor: 'move' , revert :true} );
	
	$(".group").draggable({ cursor: 'move' , revert : false , handle : 'h3'} );
	
	$( ".group" ).droppable({
			drop: function( event, ui ) {
				var group_id = $(this).attr('id').replace('group_',''); 
				var form_id = "#form_"+$(ui.draggable).attr('id');
				var form = $(form_id);				
				var old_group_id = $(form_id+ " input[name=task[group_id]]").val();
				$(form_id+ " input[name=task[group_id]]").val(group_id);
				form.bind('ajax:complete', function() {
					createVisualEffects();
					$(ui.draggable).hide();
				});
				form.callRemote();
			}
	});
	
}



