.class LSLGifIcons$1$2;
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
    .line 80
    iput-object p1, p0, LSLGifIcons$1$2;->this$0:LSLGifIcons$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, LSLGifIcons$1$2;->this$0:LSLGifIcons$1;

    iget-object v0, v0, LSLGifIcons$1;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method
