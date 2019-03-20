package WebProject;

public class AudioDTO {
	private String Id;
	private String Pass;
	private int AudioNum;
	private float volume;
	private int Slot;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getPass() {
		return Pass;
	}

	public void setPass(String pass) {
		Pass = pass;
	}

	public int getAudioNum() {
		return AudioNum;
	}

	public void setAudioNum(int audioNum) {
		AudioNum = audioNum;
	}

	public float getVolume() {
		return volume;
	}

	public void setVolume(float volume) {
		this.volume = volume;
	}

	public int getSlot() {
		return Slot;
	}

	public void setSlot(int slot) {
		Slot = slot;
	}

}
