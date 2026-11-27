.class LSLGifIcons$2$1;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLGifIcons$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLGifIcons$2;

.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(LSLGifIcons$2;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 109
    iput-object p1, p0, LSLGifIcons$2$1;->this$0:LSLGifIcons$2;

    iput-object p2, p0, LSLGifIcons$2$1;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 109
    iget-object v0, p0, LSLGifIcons$2$1;->this$0:LSLGifIcons$2;

    iget-object v0, v0, LSLGifIcons$2;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, LSLGifIcons$2$1;->val$message:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, LSLGifIcons$2$1;->this$0:LSLGifIcons$2;

    iget-object v0, v0, LSLGifIcons$2;->val$a:Landroid/app/Activity;

    const-string v1, "Animated icon saved"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, LSLGifIcons$2$1;->this$0:LSLGifIcons$2;

    iget-object v0, v0, LSLGifIcons$2;->val$a:Landroid/app/Activity;

    iget-object v1, p0, LSLGifIcons$2$1;->this$0:LSLGifIcons$2;

    iget v1, v1, LSLGifIcons$2;->val$id:I

    invoke-static {v0, v1}, LSLGifIcons;->access$600(Landroid/app/Activity;I)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, LSLGifIcons$2$1;->this$0:LSLGifIcons$2;

    iget-object v0, v0, LSLGifIcons$2;->val$a:Landroid/app/Activity;

    iget-object v1, p0, LSLGifIcons$2$1;->val$message:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
