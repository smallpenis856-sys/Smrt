.class LSLGifIcons$1$3;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLGifIcons$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLGifIcons$1;


# direct methods
.method constructor <init>(LSLGifIcons$1;)V
    .locals 0

    .prologue
    .line 38
    iput-object p1, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 39
    if-nez p2, :cond_1

    .line 41
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "image/gif"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 42
    iget-object v1, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v1, v1, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    const/16 v2, 0x7461

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    :cond_0
    :goto_0
    return-void

    .line 43
    :catch_0
    move-exception v0

    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    const-string v1, "No file picker available"

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 44
    :cond_1
    if-ne p2, v3, :cond_2

    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-static {v0}, LSLGifIcons;->access$100(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iget-object v1, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget v1, v1, LSLGifIcons$1;->val$id:I

    invoke-static {v1}, LSLGifIcons;->access$000(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 45
    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-static {v0}, LSLGifIcons;->access$100(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget v1, v1, LSLGifIcons$1;->val$id:I

    invoke-static {v1}, LSLGifIcons;->access$000(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    const-string v1, "Could not remove animated icon"

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 46
    :cond_2
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    .line 47
    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-static {v0}, LSLGifIcons;->access$100(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget v1, v1, LSLGifIcons$1;->val$id:I

    invoke-static {v1}, LSLGifIcons;->access$000(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    const-string v1, "Animated icon removed"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    .line 48
    :cond_3
    iget-object v0, p0, LSLGifIcons$1$3;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    const-string v1, "Could not remove animated icon"

    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0
.end method
