Ext.ux.TreeCheckNodeUIS = function() {
    // 多选: 'multiple'(默认)
    // 单选: 'single'
    // 级联多选: 'cascade'(同时选父和子);'parentCascade'(选父);'childCascade'(选子)
    this.checkModel = 'single';
    // only leaf can checked
    this.onlyLeafCheckable = false;
     
    Ext.ux.TreeCheckNodeUIS.superclass.constructor.apply(this, arguments);
};
Ext.extend(Ext.ux.TreeCheckNodeUIS, Ext.tree.TreeNodeUI, {
            renderElements : function(n, a, targetNode, bulkRender) {
                var tree = n.getOwnerTree();
                this.checkModel = tree.checkModel || this.checkModel;
            //    this.checkModel='single';
                this.onlyLeafCheckable = tree.onlyLeafCheckable || false;
                // add some indent caching, this helps performance when
                // rendering a large tree
                this.indentMarkup = n.parentNode ? n.parentNode.ui
                        .getChildIndent() : '';
                // var cb = typeof a.checked == 'boolean';
                var cb = (!this.onlyLeafCheckable || a.leaf);
                var href = a.href ? a.href : Ext.isGecko ? "" : "#";
                var buf = [
                        '<li class="x-tree-node"><div ext:tree-node-id="',
                        n.id,
                        '" class="x-tree-node-el x-tree-node-leaf x-unselectable ',
                        a.cls,
                        '" unselectable="on">',
                        '<span class="x-tree-node-indent">',
                        this.indentMarkup,
                        "</span>",
                        '<img src="',
                        this.emptyIcon,
                        '" class="x-tree-ec-icon x-tree-elbow" />',
                        '<img class="x-tree-node-cb" src="'+rootPath+'/page/common/images/'
                                + n.attributes.checked + 's.gif">',
                        '<a hidefocus="on" class="x-tree-node-anchor" href="',
                        href,
                        '" tabIndex="1" ',
                        a.hrefTarget ? ' target="' + a.hrefTarget + '"' : "",
                        '><span unselectable="on">',
                        n.text,
                        "</span></a></div>",
                        '<ul class="x-tree-node-ct" style="display:none;"></ul>',
                        "</li>"].join('');
                      
                var nel;
                if (bulkRender !== true && n.nextSibling
                        && (nel = n.nextSibling.ui.getEl())) {
                    this.wrap = Ext.DomHelper.insertHtml("beforeBegin", nel,
                            buf);
                } else {
                    this.wrap = Ext.DomHelper.insertHtml("beforeEnd",
                            targetNode, buf);
                }
                this.elNode = this.wrap.childNodes[0];
                this.ctNode = this.wrap.childNodes[1];
                var cs = this.elNode.childNodes;
                this.indentNode = cs[0];
                this.ecNode = cs[1];
                var index = 2;
                if (cb) {
                    this.checkbox = cs[2];
                    Ext.fly(this.checkbox).on('click',
                            this.onCheck.createDelegate(this, [null]));
                    index++;
                }
                this.anchor = cs[index];
                this.textNode = cs[index].firstChild;
            },
            // private
            onCheck : function() {
                this.check(this.toggleCheck(this.node.attributes.checked));
            },
            check : function(checked) {
            	 
                var n = this.node;
                n.attributes.checked = checked;
                this.setNodeIcon(n);
                this.childCheck(n, n.attributes.checked);
                this.parentCheck(n);
                if(checked=='all')
                {
                	 this.Singlecheck(n);
                }
               
            },
            Singlecheck:function(node)
            {
                 var currentNode=node;
                 var parentNode=currentNode.parentNode;
                    while ((parentNode = currentNode.parentNode) != null) {
                     
                        Ext.each(parentNode.childNodes, function(child) {
                       	        if(child!=currentNode)
                       	        {
                       	         if (child.attributes.checked == 'all'||child.attributes.checked == 'part')
                       	          {
                       	          	   child.attributes.checked='none';
                       	         	   this.setNodeIcon(child);
                       	          	   this.childCheck(child, 'none');
                       	       	  }
                      	        }
                               
                            },this);
                             if (currentNode.getUI().checkbox)
                             {
                                   parentNode.attributes.checked='part';
                         		  this.setNodeIcon(parentNode);
                             }
                        currentNode=parentNode;
                    }
                         
             },
            parentCheck : function(node) {
                var currentNode = node;
                while ((currentNode = currentNode.parentNode) != null) {
                    if (!currentNode.getUI().checkbox)
                        continue;
                    var part = false;
                    var sel = 0;
                    Ext.each(currentNode.childNodes, function(child) {
                                if (child.attributes.checked == 'all')
                                    sel++;
                                else if (child.attributes.checked == 'part') {
                                    part = true;
                                    return false;
                                }
                            });
                    if (part)
                        currentNode.attributes.checked = 'part';
                    else {
                        var selType = null;
                        if (sel == currentNode.childNodes.length) {
                            currentNode.attributes.checked = 'all';
                        } else if (sel == 0) {
                            currentNode.attributes.checked = 'none';
                        } else {
                            currentNode.attributes.checked = 'part';
                        }
                    }
                    this.setNodeIcon(currentNode);
                };
            },
            setNodeIcon : function(n) {
                if (n.getUI() && n.getUI().checkbox)
                    n.getUI().checkbox.src = rootPath+'/page/common/images/'
                            + n.attributes.checked + 's.gif';
                          
            },
            // private
            childCheck : function(node, checked) {
                // node.expand(true,true);
                if (node.childNodes)
                    Ext.each(node.childNodes, function(child) {
                                child.attributes.checked = checked;
                                this.setNodeIcon(child);
                                this.childCheck(child, checked);
                            }, this);
            },
            toggleCheck : function(value) {
                return (value == 'all' || value == 'part') ? 'none' : 'all';
            }
        });

