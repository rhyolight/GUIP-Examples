

<html>
    <head>
        <gui:resources components="dataTable" mode="debug"/>
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
                
                <gui:dataTable id="peopleTable"
                    columnDefs="[
                        [firstName:'First Name', sortable:true], 
                        [lastName:'Last Name'], 
                        [birthDate:'DOB'], 
                        [city:'city']
                    ]"
                    rowsPerPage='5'
                    sortedBy='lastName'
                    controller="person" action="ajaxList"
                />
                
                <script>
                    YAHOO.util.Event.onDOMReady(function() {
                        GRAILSUI.peopleTable.subscribe('rowClickEvent',
                            function(obj) {
                                var selectedRow = this.getSelectedRows()[0];
                                var r = this.getRecord(selectedRow);
                                alert('clicked ' + r.getData().lastName);
                            }
                        )
                    });
                </script>
                
            </div>
            <div class="paginateButtons">
                <g:paginate total="${personInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
