.class LSLWaContactSearch$4;
.super Ljava/lang/Object;
.source "SLWaContactSearch.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LSLWaContactSearch;->show(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LSLWaContactSearch;

.field final synthetic val$c:LSLWaContactSearch$Contact;


# direct methods
.method constructor <init>(LSLWaContactSearch;LSLWaContactSearch$Contact;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 226
    iput-object p1, p0, LSLWaContactSearch$4;->this$0:LSLWaContactSearch;

    iput-object p2, p0, LSLWaContactSearch$4;->val$c:LSLWaContactSearch$Contact;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .prologue
    .line 227
    iget-object v0, p0, LSLWaContactSearch$4;->this$0:LSLWaContactSearch;

    iget-object v1, p0, LSLWaContactSearch$4;->val$c:LSLWaContactSearch$Contact;

    iget-object v1, v1, LSLWaContactSearch$Contact;->phone:Ljava/lang/String;

    invoke-static {v0, v1}, LSLWaContactSearch;->access$1000(LSLWaContactSearch;Ljava/lang/String;)V

    return-void
.end method
