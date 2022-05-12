package bean;

public class RoomBean {
	private String room_id,room;
	public RoomBean(){}
	public RoomBean(String rid,String room){
		this.room_id = rid;
		this.room = room;
	}
	
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
}
