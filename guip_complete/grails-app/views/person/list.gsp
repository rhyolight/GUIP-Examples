

<html>
    <head>
        <gui:resources components="dialog, dataTable"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                
                <gui:dataTable
                    controller="person" action="ajaxTable"
                    columnDefs="[
                        [name:'Full Name', sortable:'true'],
                        [birthDate:'DOB', sortable:'true', formatter:'date'],
                        [age:'Age'],
                        [city:'City', sortable:'true'],
                        [state:'State', sortable:'true'],
                        [country:'Country', sortable:'true', formatter:'number']
                    ]"
                    sortedBy='name'
                />
                
                <br/>
                <br/>
                
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'person.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}" />
                        
                            <th><g:message code="person.address.label" default="Address" /></th>
                   	    
                            <g:sortableColumn property="firstName" title="${message(code: 'person.firstName.label', default: 'First Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${personInstanceList}" status="i" var="personInstance">
                        <tr class="personList ${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: personInstance, field: "lastName")}</td>
                        
                            <td><a class="addressDetailTrigger" id="trigger_${personInstance.address.id}" href="#">${fieldValue(bean: personInstance, field: "address")}</a></td>
                        
                            <td>${fieldValue(bean: personInstance, field: "firstName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <gui:dialog id="addressDialog" modal='true'>
                <div id="addressDetail">NOTHING HERE</div>
            </gui:dialog>
            <script>
                YAHOO.util.Event.onDOMReady(function() {
                    var triggers = YAHOO.util.Dom.getElementsByClassName('addressDetailTrigger', 'a');
                    for (var i in triggers) {
                        var trigger = triggers[i];
                        YAHOO.util.Event.on(trigger, 'click', function() {
                            var callback = {
                                success: function(response) {
                                    YAHOO.util.Dom.get('addressDetail').innerHTML = response.responseText;
                                },
                            }
                            var addressId = trigger.id.split('_')[1];
                            YAHOO.util.Connect.asyncRequest('GET', '${createLink(controller:"address", action:"ajaxDetail")}?addressId=' + addressId, callback, null);
                            GRAILSUI.addressDialog.show();
                        }, trigger);
                    }
                });
            </script>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
