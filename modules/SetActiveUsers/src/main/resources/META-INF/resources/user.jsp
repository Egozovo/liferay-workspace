<%@include file="/init.jsp"%>
<portlet:defineObjects />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<strong>I didn't understand how to do it</strong>



<portlet:renderURL var="pageUser">
    <portlet:param name="mvcPath" value="/user.jsp"/>
</portlet:renderURL>

<portlet:actionURL var="actionPage">
    <aui:input name="userUrl" value="<%=user%>"/>
</portlet:actionURL>

<liferay-ui:search-container>

    <liferay-ui:search-container-results results="<%= userLocalService.getUsers(-1, -1) %>" />



    <liferay-ui:search-container-row className="com.liferay.portal.kernel.model.User" escapedModel="true" modelVar="user" >
        <liferay-ui:search-container-column-text name="id" property="userId" valign="top" />

        <liferay-ui:search-container-column-text name="FIO" valign="top" >
            <strong><%= user.getFirstName()+ " " + user.getMiddleName() + " " + user.getLastName() %></strong>

            <br />
        </liferay-ui:search-container-column-text>

        <liferay-ui:search-container-column-text name="Email" property="emailAddress" valign="top" />

        <liferay-ui:search-container-column-text name="Position" property="jobTitle" valign="top" />

        <liferay-ui:search-container-column-text name="Birthday" valign="top" >

            <%
                String oldDateString = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault()).format(user.getBirthday());
                SimpleDateFormat oldDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
                SimpleDateFormat newDateFormat = new SimpleDateFormat("dd MMMM yyyy", Locale.getDefault());

                Date date = oldDateFormat.parse(oldDateString);
                String result = newDateFormat.format(date);
            %>

            <%= result%>

        </liferay-ui:search-container-column-text>

        <liferay-ui:search-container-column-text name="Phones" valign="top" >

            <%
                StringBuilder str = new StringBuilder();
                for (Phone p : user.getPhones()){
                    str.append(p.getNumber() + ", ");
                }
            %>
            <%= str%>

        </liferay-ui:search-container-column-text>

        <liferay-ui:search-container-column-text name="Organization"  valign="top" >

            <%
                StringBuilder str = new StringBuilder();
                for (Organization o : user.getOrganizations()){
                    str.append(o.getName() + ", ");
                }
            %>
            <%= str%>

        </liferay-ui:search-container-column-text>

    </liferay-ui:search-container-row>

    <liferay-ui:search-iterator />

</liferay-ui:search-container>