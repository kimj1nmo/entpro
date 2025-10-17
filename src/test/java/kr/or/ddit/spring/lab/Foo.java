package kr.or.ddit.spring.lab;

public class Foo {
	private Baz baz;
	private Bar bar;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Baz getBaz() {
		return baz;
	}

	public void setBaz(Baz baz) {
		this.baz = baz;
	}


	public Bar getBar() {
		return bar;
	}


	public void setBar(Bar bar) {
		this.bar = bar;
	}

}
