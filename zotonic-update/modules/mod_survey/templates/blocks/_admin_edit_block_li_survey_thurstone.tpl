{% extends "admin_edit_widget_i18n.tpl" %}

{% block widget_title %}{_ Block _}{% endblock %}
{% block widget_show_minimized %}false{% endblock %}
{% block widget_id %}edit-block-{{ name }}{% endblock %}

{% block widget_content %}
{% with m.rsc[id] as r %}
<fieldset class="form-vertical">
    <div class="control-group">
    {% if is_editable %}
        <input type="text" id="block-{{name}}-prompt{{ lang_code_with_dollar }}" name="block-{{name}}-prompt{{ lang_code_with_dollar }}" 
               class="span8" value="{{ blk.prompt[lang_code] }}"
               placeholder="{_ Prompt _} ({{ lang_code }})" />

       <label>{_ List of possible answers, one per line. Use <em>value#answer</em> for selecting values. _}</label>
       <textarea id="block-{{name}}-answers{{ lang_code_with_dollar }}" name="block-{{name}}-answers{{ lang_code_with_dollar }}" 
              class="span8" rows="6"
              placeholder="{_ Answers, one per line _} ({{ lang_code }})" >{{ blk.answers[lang_code] }}</textarea>
    {% else %}
        <p>{{ blk.prompt[lang_code] }}</p>
    {% endif %}
    </div>
</fieldset>
{% endwith %}
{% endblock %}

{% block widget_content_nolang %}
<fieldset class="form-vertical">
    <div class="control-group">
        <label class="checkbox">
            <input type="checkbox" id="block-{{name}}-is_multiple" name="block-{{name}}-is_multiple" value="1" {% if blk.is_multiple %}checked="checked"{% endif %} />
            {_ Multiple answers possible (use checkboxes instead of radio buttons) _}
        </label>

        <label class="checkbox">
            <input type="checkbox" id="block-{{name}}-is_required" name="block-{{name}}-is_required" value="1" {% if blk.is_required or is_new %}checked="checked"{% endif %} />
            {_ Required, this question must be answered. _}
        </label>
    </div>
</fieldset>
{% endblock %}

