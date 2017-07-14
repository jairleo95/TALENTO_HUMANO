/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.webservices;

import com.google.gson.Gson;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Cesar
 */
@Path("authorization")
public class AuthorizationResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of AuthorizationResource
     */
    public AuthorizationResource() {
    }

    /**
     * Retrieves representation of an instance of
     * pe.edu.upeu.application.webservices.AuthorizationResource
     *
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson(@Context HttpServletRequest request) {
        Gson gson = new Gson();
        return gson.toJson(request.getSession(false));
    }

    /**
     * PUT method for updating or creating an instance of AuthorizationResource
     *
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void putJson(String content) {
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public String postJson(@Context HttpServletRequest request) {
        Gson gson = new Gson();
        return gson.toJson(request.getSession(false));
    }
}
