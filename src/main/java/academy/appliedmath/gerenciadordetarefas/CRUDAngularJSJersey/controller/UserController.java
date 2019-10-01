package academy.appliedmath.gerenciadordetarefas.CRUDAngularJSJersey.controller;

import java.util.List;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import academy.appliedmath.gerenciadordetarefas.CRUDAngularJSJersey.bean.User;
import academy.appliedmath.gerenciadordetarefas.CRUDAngularJSJersey.service.UserService;


@Path("/crud")
public class UserController {
	
	UserService userService = new UserService();
	
    @GET
    @Produces(MediaType.APPLICATION_JSON)
	public List<User> getuserlist()
	{
		
		List<User> listOfuserlist = userService.getAlluserlist();
		return listOfuserlist;
	}

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
	public User getuserById(@PathParam("id") int id) throws Exception
	{
		return userService.getuser(id);
	}
   
    @POST
    @Produces(MediaType.APPLICATION_JSON)
	public User adduser(User user)
	{
    	System.out.println("[Back-end] Adicionando " + user.getuserName());
		return userService.adduser(user);
	}

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
	public User updateuser(User user)
	{
		return userService.updateuser(user);
		
	}
	
    @DELETE
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
	public void deleteuser(@PathParam("id") int id)
	{
		 userService.deleteuser(id);
		
	}
	
}
