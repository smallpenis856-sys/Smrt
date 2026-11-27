.class LSLGifIcons$9$1;
.super Ljava/lang/Object;
.source "SLGifIcons.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLGifIcons$9;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLGifIcons$9;


# direct methods
.method constructor <init>(LSLGifIcons$9;)V
    .locals 0

    .prologue
    .line 194
    iput-object p1, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 195
    iget-object v0, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget-object v0, v0, LSLGifIcons$9;->val$a:Landroid/app/Activity;

    invoke-static {v0}, LSLGifIcons;->access$500(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget v1, v1, LSLGifIcons$9;->val$id:I

    invoke-static {v1}, LSLGifIcons;->access$000(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget-object v2, v2, LSLGifIcons$9;->val$style:LSLGifIcons$Style;

    iget v2, v2, LSLGifIcons$Style;->size:I

    invoke-static {v2}, LSLGifGeometry;->size(I)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget v1, v1, LSLGifIcons$9;->val$id:I

    invoke-static {v1}, LSLGifIcons;->access$200(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget-object v2, v2, LSLGifIcons$9;->val$style:LSLGifIcons$Style;

    iget v2, v2, LSLGifIcons$Style;->mode:I

    invoke-static {v2}, LSLGifGeometry;->mode(I)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget v1, v1, LSLGifIcons$9;->val$id:I

    invoke-static {v1}, LSLGifIcons;->access$300(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget-object v2, v2, LSLGifIcons$9;->val$style:LSLGifIcons$Style;

    iget v2, v2, LSLGifIcons$Style;->shape:I

    invoke-static {v2}, LSLGifGeometry;->shape(I)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    .line 196
    if-eqz v0, :cond_0

    iget-object v0, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget-object v0, v0, LSLGifIcons$9;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    iget-object v0, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget-object v0, v0, LSLGifIcons$9;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 197
    :goto_0
    return-void

    .line 196
    :cond_0
    iget-object v0, p0, LSLGifIcons$9$1;->this$0:LSLGifIcons$9;

    iget-object v0, v0, LSLGifIcons$9;->val$a:Landroid/app/Activity;

    const-string v1, "Could not save GIF options"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
