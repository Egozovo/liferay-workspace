package com.liferay.test.nikita.portlet;


import com.liferay.portal.kernel.service.UserLocalService;
import com.liferay.test.nikita.constants.MainPortletKeys;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import javax.portlet.*;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;
import java.io.IOException;


/**
 * @author nikit
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=NikitaPorohov_Test",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + MainPortletKeys.MAIN,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class MainPortlet extends MVCPortlet {

	@Reference
	private volatile UserLocalService _userLocalService;

	public UserLocalService getUserLocalService() {
		return _userLocalService;
	}


	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("userLocalService", getUserLocalService());
		super.render(renderRequest, renderResponse);
	}


}