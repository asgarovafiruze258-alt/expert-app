// EXPERT — ai-assistant Supabase Edge Function
// Deploy: Supabase Dashboard → Edge Functions → Create a new function →
// name it "ai-assistant" → paste this file's content → Deploy.
// Secret: Project Settings → Edge Functions → Secrets → add ANTHROPIC_API_KEY.

const ANTHROPIC_API_KEY = Deno.env.get("ANTHROPIC_API_KEY");
const ANTHROPIC_URL = "https://api.anthropic.com/v1/messages";
const MODEL = "claude-3-5-sonnet-latest";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

const BUDGET_SYSTEM_PROMPT = `Sən Azərbaycanda ev təmiri üzrə büdcə mütəxəssisisən.
İstifadəçi təmir işini sərbəst mətnlə təsvir edir. Cavabı YALNIZ aşağıdakı JSON
formatında qaytar, başqa heç bir mətn, izahat və ya markdown əlavə etmə:

{"estimatedBudget": number, "items": [{"itemType": "work"|"material"|"worker", "label": string, "estimatedCost": number}]}

Qiymətlər Azərbaycan manatında (AZN) və Azərbaycan tikinti/təmir bazarının
təxmini qiymətlərinə uyğun realistik olsun. "work" — görüləcək iş (məs. kafel
döşəmə işi), "material" — lazım olan material (məs. kafel, boya), "worker" —
əgər konkret usta xidməti nəzərdə tutulur.`;

const CHAT_SYSTEM_PROMPT = `Sən EXPERT tətbiqinin ev təmiri üzrə köməkçisisən.
Azərbaycan dilində qısa, dəqiq və faydalı cavablar ver. Mümkünsə istifadəçiyə
lazım ola biləcək usta kateqoriyasını da qeyd et (məsələn: santexnik, elektrik,
kafelçi, rəngsaz, dülgər). Tikinti materialları haqqında da məsləhət verə bilərsən.`;

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const { mode, prompt, history } = await req.json();

    const systemPrompt = mode === "budget_estimate" ? BUDGET_SYSTEM_PROMPT : CHAT_SYSTEM_PROMPT;
    const messages = Array.isArray(history)
      ? [...history, { role: "user", content: prompt }]
      : [{ role: "user", content: prompt }];

    const anthropicRes = await fetch(ANTHROPIC_URL, {
      method: "POST",
      headers: {
        "content-type": "application/json",
        "x-api-key": ANTHROPIC_API_KEY ?? "",
        "anthropic-version": "2023-06-01",
      },
      body: JSON.stringify({
        model: MODEL,
        max_tokens: 1024,
        system: systemPrompt,
        messages,
      }),
    });

    if (!anthropicRes.ok) {
      const errText = await anthropicRes.text();
      return new Response(JSON.stringify({ error: errText }), {
        status: 502,
        headers: { ...corsHeaders, "content-type": "application/json" },
      });
    }

    const data = await anthropicRes.json();
    const text = data.content?.[0]?.text ?? "";

    return new Response(JSON.stringify({ text }), {
      headers: { ...corsHeaders, "content-type": "application/json" },
    });
  } catch (e) {
    return new Response(JSON.stringify({ error: String(e) }), {
      status: 500,
      headers: { ...corsHeaders, "content-type": "application/json" },
    });
  }
});
