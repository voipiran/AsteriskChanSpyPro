VOIPIRAN ChanSpy Pro
# شنود پیشرفته در سیستم‌های تلفنی Issabel و FreePBX

این پروژه به شما امکان می‌دهد انواع مختلف شنود تماس (ChanSpy) را به‌صورت حرفه‌ای روی سیستم‌های Issabel و FreePBX فعال کنید. این قابلیت به‌ویژه در مراکز تماس (Call Center) و سیستم‌های مانیتورینگ کیفیت تماس ارزشمند است.

چرا شنود پیشرفته مهم است؟

در سیستم‌های تلفنی VoIP، مدیر یا ناظر تماس نیاز دارد بدون ایجاد مزاحمت برای مکالمه اصلی، کیفیت سرویس را بررسی کند یا حتی در مواقع اضطراری، به اپراتور کمک کند. ChanSpy این امکان را فراهم می‌کند که:

تنها شنود تماس بدون اطلاع طرفین

شنود با صحبت پنهانی (Whisper) برای آموزش اپراتور

شنود دوطرفه (Barge) برای ورود مستقیم به مکالمه

شنود خصوصی (Private Whisper) برای راهنمایی بدون شنیدن صدای مشتری

انواع حالت‌ها (Dialplan Extensions)

30X. – شنود معمولی
شنیدن تماس اپراتور بدون ایجاد صدا یا مزاحمت.
مثال: شماره‌گیری 3012 یعنی شنود اپراتور 12.

31X. – شنود یک‌طرفه (Outgoing Only)
فقط صدای خروجی (اپراتور) شنیده می‌شود.
مثال: شماره‌گیری 3112 یعنی شنیدن صدای اپراتور 12 بدون شنیدن مشتری.

32X. – شنود با راهنمایی (Whisper)
مدیر می‌تواند به اپراتور راهنمایی بدهد و مشتری صدای او را نمی‌شنود.
مثال: شماره‌گیری 3212 یعنی شنود و صحبت با اپراتور 12.

33X. – شنود خصوصی (Private Whisper)
مدیر می‌تواند به اپراتور پیام بدهد ولی صدای مشتری را نمی‌شنود.

34X. – ورود مستقیم (Barge)
مدیر مستقیماً وارد مکالمه می‌شود و هر دو طرف صدای او را می‌شنوند.

نصب سریع (Quick Install)

روی سرور Issabel یا FreePBX دستور زیر را اجرا کنید:
```
curl -L -o voipiran_chanspy.zip https://github.com/voipiran/VOIPIRAN-ChanSpyPro/archive/master.zip && unzip voipiran_chanspy.zip && cd VOIPIRAN-ChanSpyPro-master && chmod 755 install_voipiran_chansp.sh && ./install_voipiran_chanspy.sh -y

```
این اسکریپت به صورت خودکار:

کدهای موردنیاز را در extensions_custom.conf اضافه می‌کند

سرویس Asterisk را reload می‌کند

برای استفاده آماده است

نحوه استفاده

پس از نصب، از داخلی خود به این شکل شماره‌گیری کنید:

30X. برای شنود ساده

32X. برای شنود و صحبت پنهانی با اپراتور

34X. برای ورود مستقیم به تماس

مثال:
شماره‌گیری 3210 یعنی "شنود و راهنمایی اپراتور داخلی 10".

English Section
VOIPIRAN ChanSpy Pro – Advanced Call Monitoring for Issabel & FreePBX

This project enables advanced call monitoring modes (ChanSpy) for Asterisk-based PBXs such as Issabel and FreePBX. It is especially valuable for call centers and quality assurance teams.

Why is this important?
Supervisors can listen to live calls, coach agents in real time, or even barge into calls when necessary — without disrupting customer experience unnecessarily.

Modes included:

30X. – Standard spy (listen silently)

31X. – Outgoing audio only (hear only the agent’s voice)

32X. – Whisper mode (coach the agent without the customer hearing)

33X. – Private whisper (talk to the agent without hearing the customer)

34X. – Barge mode (join the call as a 3rd participant)

Quick Install Command:
```
curl -L -o voipiran_chanspy.zip https://github.com/voipiran/VOIPIRAN-ChanSpyPro/archive/master.zip && unzip voipiran_chanspy.zip && cd VOIPIRAN-ChanSpyPro-master && chmod 755 install_voipiran_chanspy.sh && ./install_voipiran_chanspy.sh -y

```
