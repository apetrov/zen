// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function createVisualEffects(){
	$(".draggable").draggable({ cursor: 'move' , revert :true, handle : '.handle' } );
	
	$(".group").draggable({
		cursor: 'move' , 
		revert : false ,
		handle : '.handle',
		drag: function(){
			$(this).children('ul').hide();
			//$('.space').css('height','100px');
			//$('.space').css('width','250px');
		},
		stop:function(){
			$(this).children('ul').show();
			//$('.space').css('height','30px');
			//$('.space').css('width','100px');
			
		}
	} );
	
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
	
	// $('.space').droppable({
	// 	drop: function(event,ui){
	// 		
	// 	}
	// });	
}

function unbindGroupFromSpace(group_id,space_id){
	$.ajax({
		url: '/groups/'+group_id+"/unbind",
		type : 'post',
		data : {
			space_id : space_id
		}
	});
}

function addGroupToSpace(group_id,space_id){
	///var space_id = $(this).attr('id').replace('space_',''); 
	//var group_id = $(ui.draggable).attr('id').replace('group_',''); 
	$.ajax({
		url : '/spaces/'+space_id+"/group_spaces",
		type: 'post',
		data : {
			'group_space[group_id]' : group_id
		},
	});
	var infoBar = '#group_'+group_id+' .group-info';
	$(info).html('Group has been added on the space').show();
	
	
	//$(this).highlight();
}



