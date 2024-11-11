resource "aws_route53_zone" "kutt_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "kutt_record" {
  zone_id = aws_route53_zone.kutt_zone.id
  name    = "kutt"
  type    = "A"
  alias {
    name                   = aws_lb.kutt_alb.dns_name
    zone_id                = aws_lb.kutt_alb.zone_id
    evaluate_target_health = true
  }
}
