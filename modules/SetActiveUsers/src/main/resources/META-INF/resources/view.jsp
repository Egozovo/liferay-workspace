<%@ include file="/init.jsp" %>
<portlet:defineObjects />

<strong>List Users</strong>


<liferay-ui:search-container total = "<%= userLocalService.getUsersCount() %>" >

	<liferay-ui:search-container-results results="<%= userLocalService.getUsers(-1, -1) %>" />

	<liferay-ui:search-container-row className="com.liferay.portal.kernel.model.User" escapedModel="true" modelVar="user" >

		<liferay-ui:search-container-column-text name="href"  valign="top" >

			<portlet:renderURL var="varA">
				<portlet:param name="mvcPath" value="/user.jsp"/>
			</portlet:renderURL>

			<a href="<%=varA %>"><strong><%= user.getFirstName()+ " " + user.getMiddleName() + " " + user.getLastName() %></strong>
			</a>

		</liferay-ui:search-container-column-text>

	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />

</liferay-ui:search-container>

