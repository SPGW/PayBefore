import{P as e,c as t}from"../_/XOwiQ_Qv.js";import"qs";class _StripeEvent extends Event{constructor(e,t){super(e);this.data=t}}class StripeEmitter{constructor(){this.eventTarget=new EventTarget;this.listenerMapping=new Map}on(e,t){const listenerWrapper=e=>{t(e.data)};this.listenerMapping.set(t,listenerWrapper);return this.eventTarget.addEventListener(e,listenerWrapper)}removeListener(e,t){const r=this.listenerMapping.get(t);this.listenerMapping.delete(t);return this.eventTarget.removeEventListener(e,r)}once(e,t){const listenerWrapper=e=>{t(e.data)};this.listenerMapping.set(t,listenerWrapper);return this.eventTarget.addEventListener(e,listenerWrapper,{once:true})}emit(e,t){return this.eventTarget.dispatchEvent(new _StripeEvent(e,t))}}class WebPlatformFunctions extends e{getUname(){return Promise.resolve(null)}createEmitter(){return new StripeEmitter}tryBufferData(e){if(e.file.data instanceof ReadableStream)throw new Error("Uploading a file as a stream is not supported in non-Node environments. Please open or upvote an issue at github.com/stripe/stripe-node if you use this, detailing your use-case.");return Promise.resolve(e)}createNodeHttpClient(){throw new Error("Stripe: `createNodeHttpClient()` is not available in non-Node environments. Please use `createFetchHttpClient()` instead.")}createDefaultHttpClient(){return super.createFetchHttpClient()}createNodeCryptoProvider(){throw new Error("Stripe: `createNodeCryptoProvider()` is not available in non-Node environments. Please use `createSubtleCryptoProvider()` instead.")}createDefaultCryptoProvider(){return this.createSubtleCryptoProvider()}}const r=t(new WebPlatformFunctions);export{r as Stripe,r as default};
