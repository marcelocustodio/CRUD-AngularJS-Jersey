 package academy.appliedmath.gerenciadordetarefas.CRUDAngularJSJersey.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import academy.appliedmath.gerenciadordetarefas.CRUDAngularJSJersey.bean.User;


public class UserService {

	static HashMap<Integer,User> userIdMap=getuserIdMap();


	public UserService() {
		super();

		if(userIdMap==null)
		{
			userIdMap=new HashMap<Integer,User>();
			// Creating some object of userlist while initializing
			User usera=new User(1, "Ashen",22);
			User userb=new User(4, "John",27);
			User userc=new User(3, "Jack",25);
			User userd=new User(2, "shane",23);


			userIdMap.put(1,usera);
			userIdMap.put(4,userb);
			userIdMap.put(3,userc);
			userIdMap.put(2,userd);
		}
	}

	public List<User> getAlluserlist()
	{
		List<User> userlist = new ArrayList<User>(userIdMap.values());
		return userlist;
	}

	public User getuser(int id) throws Exception
	{
		User user= userIdMap.get(id);

		if(user == null)
		{
			throw new Exception("user with id "+id+" not found");
		}
		return user;
	}
	public User adduser(User user)
	{
		user.setId(getMaxId()+1);
		userIdMap.put(user.getId(), user);
		return user;
	}

	public User updateuser(User user)
	{
		if(user.getId()<=0)
			return null;
		userIdMap.put(user.getId(), user);
		return user;

	}
	public void deleteuser(int id)
	{
		userIdMap.remove(id);
	}

	public static HashMap<Integer, User> getuserIdMap() {
		return userIdMap;
	}

	
	public static int getMaxId()
	{ 	 int max=0;
	for (int id:userIdMap.keySet()) {  
		if(max<=id)
			max=id;

	}  

	return max;


	}
}
