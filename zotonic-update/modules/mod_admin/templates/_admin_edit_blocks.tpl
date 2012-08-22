<div id="edit-blocks-wrapper">
    <input type="hidden" id="block-" name="block-" value="" /> 
    {% include "_admin_edit_block_addblock.tpl" %}
    <ul class="blocks ui-sortable" id="edit-blocks">
    {% for blk in id.blocks %}
        {% include "_admin_edit_block_li.tpl" %}
    {% endfor %}
    </ul>
</div>

{% javascript %}
$('#edit-blocks').sortable({ 
    helper: 'clone',
    handle: '.widget-header',
    revert: 'invalid',
    axis: 'y',
    start: function(event, ui) {
        z_tinymce_save($(this));
        z_tinymce_remove($(this));
    },
    stop: function(event, ui) {
        z_tinymce_add($(this));
    }
})
.on('click', '.icon-remove', function() { 
    var block = $(this).closest('li');
    z_dialog_confirm({
        title: '{_ Confirm block removal _}',
        text: '<p>{_ Do you want to remove this block? _}</p>',
        cancel: '{_ Cancel _}',
        ok: '{_ Delete _}',
        on_confirm: function() { 
                        $(block).fadeTo('fast', 0.0)
                                .slideUp('normal', 0.0, 
                                 function() { 
                                    z_tinymce_remove($(this)); 
                                    $(this).remove(); 
                                });
                    }
    })
});

$('#edit-blocks-wrapper').on('click', '.block-add-block .dropdown-menu a', function(event) {
    var block_type = $(this).data('block-type'); 
    var after_block = $(this).closest('li.block').attr('id');
    var langs = '';
    
    $('input[name=language]:checked').each(function() { langs += ',' + $(this).val(); });
    
    z_notify('admin-insert-block', { 
                z_delegate: 'mod_admin', 
                type: block_type, 
                after: after_block, 
                rsc_id: {{ id }}, 
                language: langs,
                edit_language: $('.language-tabs .active').attr('lang')
            });
    event.preventDefault();
});
{% endjavascript %}
