
public aspect TraceAspectChristensen {
	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		String info = thisJoinPointStaticPart.getSignature() + ", " + thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("[BGN]\t"+ info);
	}
	
	after(): methodToTrace() {
		System.out.println("[END]\t" + thisJoinPointStaticPart.getSourceLocation().getFileName());
	}
}
